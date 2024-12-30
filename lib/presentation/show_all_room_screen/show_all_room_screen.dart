import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hotelsbooking/presentation/from_details_screen/from_details_screen.dart';
import 'package:hotelsbooking/presentation/home_one_screen/models/hotellist_item_model.dart';
import '../../core/utils/shared_preferences_helper.dart';
import 'package:hotelsbooking/presentation/forgot_password_screen/forgot_password_screen.dart';
class ShowAllRoomScreen extends StatelessWidget {
  final HotellistItemModel? hotelItem;

  const ShowAllRoomScreen({Key? key, this.hotelItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Hotel Item received: ${hotelItem?.id}");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text("Hotel Booking"),
      ),
      body: HotelList(hotelItem: hotelItem), // Pass hotelItem to HotelList
    );
  }
}

class HotelList extends StatefulWidget {
  final HotellistItemModel? hotelItem;
  String? baseUrl = SharedPreferencesHelper.getAPI();
  HotelList({Key? key, this.hotelItem}) : super(key: key);

  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  List<Map<String, dynamic>> hotels = [];
  bool isLoading = true;
  String? baseUrl = SharedPreferencesHelper.getAPI();
  @override
  void initState() {
    super.initState();
    fetchHotelData();
  }

  Future<void> fetchHotelData() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${baseUrl}/api/hotels/detailhotel/${widget.hotelItem?.id}'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rooms = data['data']['rooms'] as List;

        setState(() {
          hotels = rooms.map((room) {
            return {
              "image": "https://via.placeholder.com/300x150.png?text=Hotel+Room", // Use a placeholder image or get it from the API
              "roomNumber": room['roomNumber'],
              "details": "Capacity: ${room['capacity']} · Price: ₫${room['price']}",
              "price": room['price'],
              "oldPrice": room['price'] * 2, // You can change this logic if you have actual old prices
              "roomId": room['_id'], // Add the roomId
            };
          }).toList();
          isLoading = false;
        });
      } else {
        // Handle error if status code is not 200
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
      // Handle error (e.g., show an error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];
        return HotelCard(
          imageUrl: hotel["image"],
          roomNumber: hotel["roomNumber"],
          details: hotel["details"],
          price: hotel["price"],
          oldPrice: hotel["oldPrice"],
          roomId: hotel["roomId"], // Pass the roomId
        );
      },
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String roomNumber;
  final String details;
  final int price;
  final int oldPrice;
  final String roomId; // Add roomId parameter

  HotelCard({
    required this.imageUrl,
    required this.roomNumber,
    required this.details,
    required this.price,
    required this.oldPrice,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Room Number
                Text(
                  roomNumber,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                // Details
                Text(
                  details,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                // Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "₫ ${oldPrice.toString()}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          "₫ ${price.toString()}",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Pass roomId to /fromdetails_screen route
                        print("Room ID: $roomId");
                        // Navigator.of(context).pushNamed(
                        //   "/fromdetails_screen",
                        //   arguments: roomId, // Send the roomId as argument
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FromDetailsScreen(roomId: roomId, price: this.price.toString(),),
                          ),
                        );
                      },
                      child: Text("Book Now", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff06B3C4),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

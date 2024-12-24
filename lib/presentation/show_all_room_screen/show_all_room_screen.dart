import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/from_details_screen/from_details_screen.dart';

class ShowAllRoomScreen extends StatelessWidget {
  const ShowAllRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).canPop();
        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Hotel Booking"),
      ),
      body: HotelList() ,
    );
  }

}

class HotelList extends StatelessWidget {
  // Fake data cho danh sách hotel
  final List<Map<String, dynamic>> hotels = [
    {
      "image": "https://via.placeholder.com/300x150.png?text=Hotel+Room+1",
      "title": "Superior Double Room",
      "details": "26 m²/280 ft² · Max 2 adults · 1 king bed",
      "price": 579457,
      "oldPrice": 2018547,
    },
    {
      "image": "https://via.placeholder.com/300x150.png?text=Hotel+Room+2",
      "title": "Deluxe King Room",
      "details": "30 m²/320 ft² · Max 3 adults · 1 king bed",
      "price": 689457,
      "oldPrice": 2218547,
    },
    {
      "image": "https://via.placeholder.com/300x150.png?text=Hotel+Room+3",
      "title": "Luxury Suite",
      "details": "40 m²/430 ft² · Max 4 adults · 2 king beds",
      "price": 879457,
      "oldPrice": 3018547,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];
        return HotelCard(
          imageUrl: hotel["image"],
          title: hotel["title"],
          details: hotel["details"],
          price: hotel["price"],
          oldPrice: hotel["oldPrice"],
        );
      },
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;
  final int price;
  final int oldPrice;

  HotelCard({
    required this.imageUrl,
    required this.title,
    required this.details,
    required this.price,
    required this.oldPrice,
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
                // Title
                Text(
                  title,
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
                        Navigator.of(context).pushNamed("/fromdetails_screen");
                      },
                      child: Text("Book Now", style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff06B3C4),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
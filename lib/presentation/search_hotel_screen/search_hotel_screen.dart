import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/from_details_screen/from_details_screen.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/hotel_inf_model.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/search_inf_model.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/widgets/hotel_item.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/services/api_services.dart';

class SearchHotelScreen extends StatefulWidget {
  const SearchHotelScreen({super.key, required this.searchInfModel});

  final SearchInfModel searchInfModel;

  @override
  State<StatefulWidget> createState() => _SearchHotelState();
}

class _SearchHotelState extends State<SearchHotelScreen> {
  List<HotelInfModel> _hotelsList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHotels();
  }

  Future<void> _fetchHotels() async {
    final apiServices = ApiServices();
    try {
      final fetchedHotels =
          await apiServices.searchHotelsServices(widget.searchInfModel);
      setState(() {
        print(2);
        print(fetchedHotels);
        if (fetchedHotels != null) {
          _hotelsList = fetchedHotels; // Lưu danh sách khách sạn vào biến
        } else {
          _hotelsList = [];
        }
        _isLoading = false; // Ngừng trạng thái loading
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Dừng trạng thái loading nếu có lỗi
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: title(context),
      ),
      body: _isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Hiển thị loading nếu đang tải
          : _hotelsList.isEmpty
              ? Center(
                  child: Text(
                      'Không có khách sạn nào.')) // Hiển thị nếu danh sách trống
              : ListView.builder(
                  itemCount: _hotelsList.length,
                  itemBuilder: (context, index) {
                    final hotel = _hotelsList[index];
                    return HotelItem(
                      hotelInf: hotel,
                    );
                  },
                ),
    );
  }

  Widget title(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.searchInfModel.location!,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                widget.searchInfModel.startDate!,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ", " + widget.searchInfModel.endDate!,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ' . ' + widget.searchInfModel.guests.toString() + " Guests",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
  late Future<List<String>?> _hotelsFuture;

  @override
  void initState() {
    super.initState();
    _hotelsFuture = ApiServices().searchHotelsServices(widget.searchInfModel);
    print(_hotelsFuture);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: title(context),
      ),
      body: HotelList() ,
    );
  }
  Widget title(BuildContext context){
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
          Text(widget.searchInfModel.location!!, style: TextStyle(fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Row(
            children: [
              Text(widget.searchInfModel.startDate!!, style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.w500),),
              Text(", " + widget.searchInfModel.endDate!!,style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.w500),),
              Text(' . ' + widget.searchInfModel.guests.toString() + " Guests", style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.w500),),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelList extends StatelessWidget {
  // Fake data cho danh sách hotel
  List<HotelInfModel> hotelList = [
    HotelInfModel('1', 'Hotel A', '4.5', 'Location A', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn9l4mYbYHE7zWna0_iCKVPWb-QwRtieHrEw&s'),
    HotelInfModel('2', 'Hotel B', '4.2', 'Location B', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_v3vI3YrdxbTqlST2n7eeX-qm_oYx1uaDPQ&s'),
    HotelInfModel('3', 'Hotel C', '4.8', 'Location C', 'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-videoSixteenByNineJumbo1600.jpg'),
    HotelInfModel('4', 'Hotel D', '3.9', 'Location D', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/592311451.jpg?k=77097d8640b78b7c234422f104bb3deea2b86655a3ba398f73cc18db451a88a3&o=&hp=1'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotelList.length,
      itemBuilder: (context, index) {
        final hotel = hotelList[index];
        return HotelItem(
          hotelInf: hotel,
        );
      },
    );
  }
}

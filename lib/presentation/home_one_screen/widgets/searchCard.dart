import 'package:flutter/material.dart';
import 'package:hotelsbooking/presentation/search_cities/search_cities_screen.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/hotel_inf_model.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/search_inf_model.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/search_hotel_screen.dart';
import 'package:hotelsbooking/presentation/search_screen/search_screen.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _searchCardState();
  }
}

class _searchCardState extends State<SearchCard> {
  TextEditingController guestsController = TextEditingController();

  String selectedCity = "Location";

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 30));

  Future displayDateRangePiker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: _startDate,
      lastDate: DateTime.now().add(
        Duration(days: 185),
      ),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  final Uri _url = Uri.parse(
      "https://translate.google.com/?hl=vi&sl=en&tl=vi&text=select%20destination&op=translate");

  Future<void> _lauchurl() async {
    if (!await launchUrl(_url)) {
      throw 'Khong the mo url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), side: BorderSide.none),
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                final result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => SearchCitiesScreen()));
                if (result != null && result is String) {
                  setState(() {
                    selectedCity = result;
                  });
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.search, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      selectedCity,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await displayDateRangePiker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16),
                          const SizedBox(width: 8),
                          Text(DateFormat('yyyy-MM-dd').format(_startDate)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await displayDateRangePiker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16),
                          const SizedBox(width: 8),
                          Text(DateFormat('yyyy-MM-dd').format(_endDate)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: guestsController,
              decoration: InputDecoration(
                hintText: "Guest",
                filled: true,
                // Bật tính năng điền màu nền
                fillColor: Colors.grey[100],
                hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if(guestsController.text.toString() != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) =>
                          SearchHotelScreen(
                            searchInfModel: SearchInfModel(
                              location: selectedCity,
                              startDate:
                              DateFormat('yyyy-MM-dd').format(_startDate),
                              endDate: DateFormat('yyyy-MM-dd').format(_endDate),
                              guests: 2
                            ),
                          )));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff06B3C4),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

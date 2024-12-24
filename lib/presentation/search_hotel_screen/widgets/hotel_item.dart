import 'package:flutter/material.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/search_hotel_screen/models/hotel_inf_model.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_image_view.dart';

class HotelItem extends StatelessWidget{
  const HotelItem({super.key, required this.hotelInf});

  final HotelInfModel hotelInf ;

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
              hotelInf.imgHotelUrl!!,
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
                  hotelInf.nameHotel!!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    CustomImageView(
                      imagePath:
                      ImageConstant.imgAntDesignStarFilled,
                      height: 14.h,
                      width: 14.h,
                    ),
                    Text(
                      hotelInf.rating!!, // Sử dụng giá trị mặc định nếu là null
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                // Details
                Text(
                  hotelInf.location!!,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                // Price
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Price for 1 night",
                //           style: TextStyle(
                //             fontSize: 14,
                //             color: Colors.grey,
                //             decoration: TextDecoration.lineThrough,
                //           ),
                //         ),
                //         Text(
                //           "VND ${price.toString()}",
                //           style: TextStyle(
                //               fontSize: 18,
                //               color: Colors.red,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
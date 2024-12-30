import 'dart:core';

class HotelInfModel {
  final String id;
  final String nameHotel;
  final String rating;
  final String location;
  final String imgHotelUrl;
  final String price;
  final List<String> amenities;

  HotelInfModel({
    required this.id,
    required this.nameHotel,
    required this.rating,
    required this.location,
    required this.imgHotelUrl,
    required this.price,
    required this.amenities,
  });

  factory HotelInfModel.fromJson(Map<String, dynamic> json) {
    final hotelData = json;
    print('1212');
    print(json);
    print('1212');

    // Kiểm tra và lấy giá trị từ `media` nếu có.
    String imageUrl = '';
    if (hotelData['hotel']['media'] is List && json['hotel']['media'].isNotEmpty) {
      imageUrl = json['hotel']['media'][0] ?? ''; // Chọn hình ảnh đầu tiên trong danh sách
    } else {
      imageUrl = ''; // Hoặc giá trị mặc định nếu không có dữ liệu hình ảnh
    }

    // Kiểm tra `lowestPrice`, nếu không có thì đặt giá trị mặc định.
    String price = json['lowestPrice']?.toString() ?? '0';

    // Trả về đối tượng HotelInfModel
    final hotel = HotelInfModel(
      id: hotelData['hotel']['_id'] ?? '',
      nameHotel: hotelData['hotel']['name'] ?? '',
      rating: hotelData['hotel']['rating']?.toString() ?? '0', // Đảm bảo là chuỗi
      location: hotelData['hotel']['location'] != null
          ? '${hotelData['hotel']['location']['city']}, ${hotelData['hotel']['location']['country']}'
          : '',
      imgHotelUrl: imageUrl,
      price: price,
      amenities: List<String>.from(hotelData['hotel']['amenities'] ?? []),
    );
    return hotel;
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http; // For HTTP requests
import 'dart:convert'; // Importing dart:convert for jsonEncode
class SharedPreferencesHelper {
  static const String _userIdKey = "_userId"; // Khóa lưu _id người dùng
  // static const String _api = "http://192.168.0.100:5000"; // Khóa lưu API người dùng
  static const String _api = "https://539f-42-118-113-41.ngrok-free.app/api/orders/create"; // Khóa lưu API người dùng


  // Lưu _id
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  // Lấy _id
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  // Xóa _id
  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }
  // Lấy API
  static String getAPI() {
    return _api;
  }

  Future<void> processPayment(String reservationId, String amount) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(SharedPreferencesHelper._userIdKey);

    final String apiUrl = "https://539f-42-118-113-41.ngrok-free.app/api/orders/create/api/orders/create";

    final Map<String, String> body = {
      "reservationId": reservationId,
      "amount": amount,
      // You can also send userId if needed by adding it to the body
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print("Payment processed successfully: ${response.body}");
    } else {
      print("Failed to process payment: ${response.body}");
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hotelsbooking/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:hotelsbooking/presentation/sign_up_screen/sign_up_screen.dart';

class SharedPreferencesHelper {
  String? baseUrl = SharedPreferencesHelper.getAPI();
  static const String _userIdKey = "_userId";
  static const String _tokenKey = "_token";
  static const String _api = "https://5146-2405-4802-6ee7-43b0-20ca-4508-95d1-bddf.ngrok-free.app";

  // Save token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Save userId
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  // Get userId
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  // Clear userId
  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }

  // Get API URL
  static String getAPI() {
    return _api;
  }

  // Process payment
  Future<void> processPayment(String reservationId, String amount) async {
    String? userId = await getUserId();
    if (userId == null) throw Exception("User ID is not available");

    final String apiUrl = "${baseUrl}/api/orders/create";

    final Map<String, String> body = {
      "reservationId": reservationId,
      "amount": amount,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print("Payment processed successfully: ${response.body}");
    } else {
      throw Exception("Failed to process payment: ${response.body}");
    }
  }

  // // Login method
  // Future<void> login(String email, String password) async {
  //   final String loginUrl = "https://25c1-2405-4802-6ee7-43b0-d9d2-2ec6-5918-682d.ngrok-free.app/api/auth/login";
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(loginUrl),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({"email": email, "password": password}),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = jsonDecode(response.body);
  //       if (responseData['success'] == true) {
  //         String token = responseData['token'];
  //         String userId = responseData['data']['_id'];
  //
  //         await saveToken(token);
  //         await saveUserId(userId);
  //         print("Login successful. Token: $token");
  //       } else {
  //         throw Exception("Login failed: ${responseData['message']}");
  //       }
  //     } else {
  //       throw Exception("HTTP Error: ${response.statusCode} - ${response.body}");
  //     }
  //   } catch (e) {
  //     throw Exception("Error during login: $e");
  //   }
  // }

  // Fetch room and hotel IDs
  Future<List<Map<String, String>>> fetchRoomAndHotelIds() async {
    String? token = await SharedPreferencesHelper.getToken();
    if (token == null) throw Exception("Token not found. Please log in first.");

    final String apiUrl = "${baseUrl}/api/transaction/customer";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        final List<dynamic> transactions = responseData['data'];
        List<Map<String, String>> roomAndHotelIds = [];

        for (var transaction in transactions) {
          if (transaction.containsKey('roomId') && transaction['roomId'] != null) {
            var roomIdData = transaction['roomId'];
            if (roomIdData.containsKey('_id') && roomIdData.containsKey('hotel') && roomIdData['hotel'] != null) {
              String roomId = roomIdData['_id'];
              String hotelId = roomIdData['hotel']['_id'];
              roomAndHotelIds.add({'roomId': roomId, 'hotelId': hotelId});
              print("Hotel ID: $hotelId");
            }
          }
        }

        return roomAndHotelIds;
      } else {
        throw Exception("API responded with an error: ${responseData['message']}");
      }
    } else {
      throw Exception("HTTP error: ${response.statusCode} - ${response.body}");
    }
  }



  // Fetch hotel details
  Future<Map<String, dynamic>> fetchHotelDetails(String hotelId) async {
    final String apiUrl = "${baseUrl}/api/hotels/detailhotel/$hotelId";
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("HTTP error: ${response.statusCode} - ${response.body}");
    }
  }
}

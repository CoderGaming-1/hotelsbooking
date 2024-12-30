import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:hotelsbooking/core/utils/shared_preferences_helper.dart';

class ReviewScreen extends StatefulWidget {
  final String roomId;

  ReviewScreen({required this.roomId, Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    final roomId = ModalRoute.of(context)?.settings.arguments as String?;
    if (roomId == null) {
      return Scaffold(
        body: Center(child: Text('Room ID is missing. Please try again later.')),
      );
    }
    return ReviewScreen(roomId: roomId);
  }

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();
  File? _mediaFile;

  // Function to pick media (image or file)
  Future<void> _pickMedia() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _mediaFile = File(pickedFile.path);
      });
    }
  }

  // Function to submit the review
  Future<void> _submitReview() async {
    final token = await SharedPreferencesHelper.getToken();
    if (token == null) {
      throw Exception("Token not found. Please log in first.");
    }

    final rating = _ratingController.text;
    final comment = _commentController.text;

    final apiUrl = "https://5146-2405-4802-6ee7-43b0-20ca-4508-95d1-bddf.ngrok-free.app/api/reviews";

    final request = http.MultipartRequest('POST', Uri.parse(apiUrl))
      ..headers['Authorization'] = "Bearer $token"
      ..fields['roomId'] = widget.roomId
      ..fields['rating'] = rating
      ..fields['comment'] = comment;

    if (_mediaFile != null) {
      final mediaStream = http.ByteStream(_mediaFile!.openRead());
      final mediaLength = await _mediaFile!.length();
      final mediaMultipart = http.MultipartFile(
        'media',
        mediaStream,
        mediaLength,
        filename: basename(_mediaFile!.path),
      );
      request.files.add(mediaMultipart);
    }

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        print("Review submitted successfully");
      } else {
        print("Failed to submit review: ${response.statusCode}");
      }
    } catch (e) {
      print("Error submitting review: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write a Review"),
        backgroundColor: Color(0xFF06B3C4), // Updated color
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Rating Input (Star Rating)
            _buildTextField(
              controller: _ratingController,
              labelText: 'Rating (1 to 5)',
              icon: Icons.star,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Comment Input
            _buildTextField(
              controller: _commentController,
              labelText: 'Comment',
              icon: Icons.comment,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),

            // Media Upload Button
            ElevatedButton.icon(
              onPressed: _pickMedia,
              icon: Icon(Icons.camera_alt),
                label: Text(
                  'Pick an Image',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF06B3C4), // Updated color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            if (_mediaFile != null) ...[
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _mediaFile!,
                  height: 200, // Adjust the height to fit the screen better
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            SizedBox(height: 16),

            // Submit Button
            ElevatedButton(
              onPressed: _submitReview,
              child: Text(
                'Submit Review',
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF06B3C4), // Updated color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required TextInputType keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF06B3C4)), // Updated color
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

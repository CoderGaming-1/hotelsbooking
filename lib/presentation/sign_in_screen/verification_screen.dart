import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../../core/utils/shared_preferences_helper.dart';
import '../../widgets/custom_text_form_field.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.email});
  final String email;
  @override
  State<StatefulWidget> createState() {
    return _verificationState();
  }
}
class _verificationState extends State<VerificationScreen>{

  TextEditingController codeController = TextEditingController();

  Future<void> verifyCode(String code) async {
    try{
      String? baseUrl = SharedPreferencesHelper.getAPI();
      Response response = await post(
        Uri.parse('${baseUrl}/api/auth/verify-email'),
        body: {
          'email': widget.email,
          'code': code
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home_one_screen');
        notificationRegister("Login successful");
      } else{
        notificationRegister("Login failed");
        print(response.statusCode);
      }
    } catch (e){

    }
  }
  void notificationRegister(String RegisterState) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          RegisterState,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF06B3C4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 32, 16),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
            Title(
              color: Colors.black,
              child: Text(
                'Verification',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Enter your code number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Enter Your Code',
                border: OutlineInputBorder(),
              ),
              // hintText: "Enter Your Code",
              //   keyboardType: TextInputType.number,
              // borderDecoration: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(15),
              //   borderSide:
              //       BorderSide(color: Color(0xFF878787), strokeAlign: 2),
              // ),
              // hintStyle: TextStyle(fontSize: 12),
              // contentPadding: EdgeInsets.all(12),
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    verifyCode(codeController.text.toString());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF06B3C4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

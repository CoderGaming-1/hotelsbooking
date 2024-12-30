import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void signUp(String email, String password, String name, String country,
      String phoneNumber) async {
    try {
      print(email);
      print(password);
      print(name);
      String? baseUrl = await SharedPreferencesHelper.getAPI();
      Response response = await post(
          Uri.parse('${baseUrl}/api/auth/register'),
          body: {
            'name': name,
            'email': email,
            "country": country,
            "phonenumber": phoneNumber,
            'password': password,
            'role': "customer"
          });
      if (response.statusCode == 201) {
        notificationRegister("Account created successfully");
        Navigator.pushNamed(context, '/home_one_screen');
        final responseData = jsonDecode(response.body);
        final userId = responseData['data']['_id'].toString();
        await SharedPreferencesHelper.saveUserId(userId);
        print(userId);
      } else {
        notificationRegister("Register failed");
        print(response.statusCode);
      }
      print(jsonDecode(response.body.toString()));
    } catch (e) {
      print(e.toString());
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
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
          child: Column(
            children: [
              //Tittle
              const Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      "Start Your Journey with affordable price",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              //email
              //password
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      //name
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          labelText: "Name",
                          hintText: "Name",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //email
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_outline_outlined),
                          labelText: "E-Mail",
                          hintText: "E-Mail",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //phone number
                      TextField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android_outlined),
                          labelText: "Phone number",
                          hintText: "Phone number",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //Address
                      TextField(
                        controller: countryController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on_sharp),
                          labelText: "Address",
                          hintText: "Address",
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //password
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: "Password",
                            hintText: "Password",
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(12),
                            // ),
                            suffixIcon: const IconButton(
                                onPressed: null,
                                icon: Icon(Icons.remove_red_eye))),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // buttonSignIn
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              signUp(
                                  emailController.text.toString(),
                                  passwordController.text.toString(),
                                  nameController.text.toString(),
                                  countryController.text.toString(),
                                  phoneNumberController.text.toString());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF06B3C4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15)),
                            child: const Text(
                              "Create Account",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Or Sign Up With"),
              const SizedBox(
                height: 10,
              ),
              //button login with facebook, google
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xF2F3F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20)),
                      onPressed: () {},
                      child: SvgPicture.asset("assets/images/ic_google.svg"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xF2F3F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20)),
                      onPressed: () {},
                      child: SvgPicture.asset("assets/images/ic_facebook.svg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Have an Account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const SignInScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      // Fully transparent foreground
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xFF06B3C4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

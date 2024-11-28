import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsbooking/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:hotelsbooking/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:http/http.dart';

import '../../core/utils/shared_preferences_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signIn(String email, String password) async {
    try {
      print(email);
      print(password);
      String? baseUrl = SharedPreferencesHelper.getAPI();
      Response response = await post(
          Uri.parse('${baseUrl}/api/auth/login'),
          body: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        notificationRegister("Login successfully");
        Navigator.pushNamed(context, '/home_one_screen');
        final responseData = jsonDecode(response.body);
        final userId = responseData['data']['_id'].toString();
        await SharedPreferencesHelper.saveUserId(userId);
        print(userId);
      } else {
        notificationRegister("Login failed");
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
    bool _isPasswordVisible = false;
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
                      "Sign in",
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
                      //email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          labelText: "E-Mail",
                          hintText: "E-Mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //password
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // Chuyển đổi trạng thái hiển thị
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                        ),
                        obscureText: !_isPasswordVisible, // Hiển thị dạng `****` nếu `_isPasswordVisible` là `false`
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //forget password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (ctx) => ForgotPassword(),

                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent,
                              // Fully transparent foreground
                              overlayColor: Colors.transparent,
                            ),
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(
                                color: Color(0xFF06B3C4),
                              ),
                            )),
                      ),
                      // buttonSignIn
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              signIn(emailController.text.toString(), passwordController.text.toString());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF06B3C4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15)),
                            child: const Text(
                              "Sign In",
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
              const Text("Or Sign In With"),
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
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/images/ic_google.svg"),
                      ),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      // Fully transparent foreground
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Sign in as guest",
                      style: TextStyle(
                        color: Color(0xFF06B3C4),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t Have an Account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const SignUpScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      // Fully transparent foreground
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Sign Up",
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


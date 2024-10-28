import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotelsbooking/presentation/sign_up_screen/sign_up_screen.dart';


class SignInScreen extends StatefulWidget{
  const SignInScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}
class _SignInScreenState extends State<SignInScreen>{
  @override
  Widget build(BuildContext context) {
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
                child:  Column(
                  children: [
                    Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 40),),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child:  Column(
                  children: [
                    Text("Start Your Journey with affordable price", style: TextStyle(color: Colors.black, fontSize: 14),),
                  ],
                ),
              ),

              const SizedBox(height: 30,),
              //email
              //password
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        decoration:  InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          labelText: "E-Mail",
                          hintText: "E-Mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      //password
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: "Password",
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: const IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye))
                        ),
                      ),
                      const SizedBox(height: 10,),
                      //forget password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent, // Fully transparent foreground
                              overlayColor: Colors.transparent,),
                            child: const Text("Forget Password?", style: TextStyle(color: Color(0xFF06B3C4),),)
                        ),
                      ),
                      // buttonSignIn
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF06B3C4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 15)
                            ),

                            child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16),)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Text("Or Sign In With"),
              const SizedBox(height: 10,),
              //button login with facebook, google
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF2F3F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20)
                      ),
                      onPressed: (){},
                      child: SvgPicture.asset("assets/icons/ic_facebook.svg"),),),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF2F3F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20)
                      ),
                      onPressed: (){},
                      child: SvgPicture.asset("assets/icons/ic_google.svg"),),),
                ],
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent, // Fully transparent foreground
                      overlayColor: Colors.transparent,),
                    child: const Text("Sign in as guest", style: TextStyle(color: Color(0xFF06B3C4),),)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t Have an Account?", style: TextStyle(color: Colors.black),),
                  TextButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const SignUpScreen(),),);
                  },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent, // Fully transparent foreground
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text("Sign Up", style: TextStyle(color: Color(0xFF06B3C4),),
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
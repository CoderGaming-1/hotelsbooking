import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsbooking/core/app_export.dart';
import 'package:hotelsbooking/presentation/home_one_screen/home_one_screen.dart';
import 'package:hotelsbooking/presentation/sign_in_screen/sign_in_screen.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstant.imgBackgroundOnBoarding),
              fit: BoxFit.cover
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 100,),
                Image (image:AssetImage(ImageConstant.imageLogo),),
                const SizedBox(height: 5,),
                SvgPicture.asset("assets/images/onboarding_name_app.svg"),
                const SizedBox(height: 60,),
                Text("msg_onboarding".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      backgroundColor: const Color(0xFF06B3C4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignInScreen(),),);
                  },
                  child: Text("lbl_get_started".tr, style:  TextStyle(color: Colors.white, fontSize: 16)),

                ),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => HomeOneScreen(),),);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.transparent, // Fully transparent foreground
                    overlayColor: Colors.transparent,
                  ),
                  child: Text(
                    "lbl_log_in_as_guest".tr,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

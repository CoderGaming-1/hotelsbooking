import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatelessWidget {
  static const String paymentScreen = '/payment_screen';

  static Widget builder(BuildContext context) {
    return PaymentScreen();
  }

  Future<void> launchPaymentUrl() async {
    String url = "https://docs.zalopay.vn/v2/?amount=50000&appid=2553&apptransid=241128_64687&bankcode=&checksum=6434e2f3d5f971c9024a97a0e34344ad64a9d759966a8508b46a5e396d642e03&discountamount=0&pmcid=0&status=-49";

    // Encode the URL
    Uri uri = Uri.parse(Uri.encodeFull(url));

    // Attempt to launch in Chrome
    try {
      if (await canLaunch(uri.toString())) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await launchPaymentUrl(); // Launch the URL when button is clicked
          },
          child: Text("Pay Now"),
        ),
      ),
    );
  }
}

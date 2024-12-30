import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) => const PaymentScreen();

  Future<void> _launchURL() async {
    const url = 'https://qcgateway.zalopay.vn/openinapp?order=eyJ6cHRyYW5zdG9rZW4iOiJBQ2I1MGE4VkJTVlFlUy10SE5Ja2Q0TEEiLCJhcHBpZCI6MjU1M30=';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Open Payment URL'),
        ),
      ),
    );
  }
}




// import 'dart:io';
// import 'package:checkout_screen_ui/checkout_ui.dart';
// import 'package:checkout_screen_ui/models/checkout_result.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// class PaymentScreen extends StatelessWidget {
//   static const String routeName = '/payment_screen';
//   const PaymentScreen({Key? key}) : super(key: key);
//   static Widget builder(BuildContext context) => PaymentScreen();
//   // This function will initialize the necessary checkout data for your PaymentScreen
//   @override
//   Widget build(BuildContext context) {
//     final demoOnlyStuff = DemoOnlyStuff();
//     final GlobalKey<CardPayButtonState> _payBtnKey =
//     GlobalKey<CardPayButtonState>();
//     Future<void> _creditPayClicked(
//         CardFormResults results, CheckOutResult checkOutResult) async {
//       _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.processing);
//       demoOnlyStuff.callTransactionApi(_payBtnKey);
//       print(results);
//       for (PriceItem item in checkOutResult.priceItems) {
//         print('Item: ${item.name} - Quantity: ${item.quantity}');
//       }
//       final String subtotal =
//       (checkOutResult.subtotalCents / 100).toStringAsFixed(2);
//       print('Subtotal: \$$subtotal');
//       final String tax = (checkOutResult.taxCents / 100).toStringAsFixed(2);
//       print('Tax: \$$tax');
//       final String total =
//       (checkOutResult.totalCostCents / 100).toStringAsFixed(2);
//       print('Total: \$$total');
//     }
//     Future<void> _nativePayClicked(BuildContext context) async {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Native Pay requires setup')));
//     }
//     Future<void> _cashPayClicked(BuildContext context) async {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Cash Pay requires setup')));
//     }
//     final List<PriceItem> _priceItems = [
//       PriceItem(name: 'Product A', quantity: 1, itemCostCents: 5200),
//       PriceItem(name: 'Product B', quantity: 2, itemCostCents: 8599),
//       PriceItem(name: 'Product C', quantity: 1, itemCostCents: 2499),
//       PriceItem(
//           name: 'Delivery Charge',
//           quantity: 1,
//           itemCostCents: 1599,
//           canEditQuantity: false),
//     ];
//     const String _payToName = 'Checkout';
//     final _isApple = kIsWeb ? false : Platform.isIOS;
//     const _footer = CheckoutPageFooter(
//       privacyLink: 'https://[Credit Processor].com/privacy',
//       termsLink: 'https://[Credit Processor].com/payment-terms/legal',
//       note: 'Powered By [Credit Processor]',
//       noteLink: 'https://[Credit Processor].com/',
//     );
//     Function? _onBack = Navigator.of(context).canPop()
//         ? () => Navigator.of(context).pop()
//         : null;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: CheckoutPage(
//         data: CheckoutData(
//           priceItems: _priceItems,
//           payToName: _payToName,
//           displayNativePay: !kIsWeb,
//           onNativePay: (checkoutResults) => _nativePayClicked(context),
//           onCashPay: (checkoutResults) => _cashPayClicked(context),
//           isApple: _isApple,
//           onCardPay: (paymentInfo, checkoutResults) =>
//               _creditPayClicked(paymentInfo, checkoutResults),
//           onBack: _onBack,
//           payBtnKey: _payBtnKey,
//           displayTestData: true,
//           taxRate: 0.07,
//         ),
//         footer: _footer,
//       ),
//     );
//   }
// }
// class DemoOnlyStuff {
//   bool shouldSucceed = true;
//   Future<void> provideSomeTimeBeforeReset(
//       GlobalKey<CardPayButtonState> _payBtnKey) async {
//     await Future.delayed(const Duration(seconds: 2), () {
//       _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.ready);
//       return;
//     });
//   }
//   Future<void> callTransactionApi(
//       GlobalKey<CardPayButtonState> _payBtnKey) async {
//     await Future.delayed(const Duration(seconds: 2), () {
//       if (shouldSucceed) {
//         _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.success);
//         shouldSucceed = false;
//       } else {
//         _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.fail);
//         shouldSucceed = true;
//       }
//       provideSomeTimeBeforeReset(_payBtnKey);
//       return;
//     });
//   }
// }

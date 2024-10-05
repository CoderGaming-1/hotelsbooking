import 'package:flutter/material.dart';

class MyBookingScreen extends StatefulWidget {

  @override

  _MyBookingScreenState createState() => _MyBookingScreenState();

}

class _MyBookingScreenState extends State<MyBookingScreen> {

  String _message = 'Welcome to My Booking Screen';

  void _updateMessage() {

    setState(() {

      _message = 'Your booking is confirmed!';

    });

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('My Booking Screen'),

      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Text(

              _message,

              style: TextStyle(fontSize: 24.0),

              textAlign: TextAlign.center,

            ),

            SizedBox(height: 20),

            ElevatedButton(

              key: Key('confirmBookingButton'),

              onPressed: _updateMessage,

              child: Text('Confirm Booking'),

            ),

          ],

        ),

      ),

    );

  }

}
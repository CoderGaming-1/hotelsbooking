import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen ({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotificationScreenState();
  }
}
class _NotificationScreenState extends State<NotificationScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
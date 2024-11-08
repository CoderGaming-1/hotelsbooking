import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Notification'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Xử lý khi nhấn nút lọc
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Unread (2)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildNotificationItem(
            context,
            profileImage: 'https://via.placeholder.com/150',
            title: 'Erik granda just sent a message',
            subtitle: 'Please check your message',
            date: 'Today at 08:00 AM',
          ),
          _buildNotificationItem(
            context,
            profileImage: 'https://via.placeholder.com/150',
            title: 'Alex just sent a photo',
            subtitle: 'Please check your message',
            date: 'Today at 09:00 AM',
            image:
                'https://digital.ihg.com/is/image/ihg/six-senses-umluj-9884572894-1x1?ts=1730405656877&dpr=off',
          ),
          Divider(),
          Text(
            'Yesterday',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildNotificationItem(
            context,
            icon: Icons.discount,
            title: 'New User Discount',
            subtitle:
                'Special for new user! You will get 50% off discount in every places.',
            date: '19 m ago',
          ),
          _buildNotificationItem(
            context,
            icon: Icons.check_circle,
            title: 'Booking Completed',
            subtitle:
                "You've booked in Infinity Castle Hotel. Please don't be late to check in.",
            date: '1 d ago',
          ),
          _buildNotificationItem(
            context,
            profileImage: 'https://via.placeholder.com/150',
            title: 'Alex just sent a photo',
            subtitle: 'Please check your message',
            date: 'Yesterday',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    String? profileImage,
    IconData? icon,
    required String title,
    required String subtitle,
    required String date,
    String? image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (profileImage != null)
            CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
              radius: 20,
            )
          else if (icon != null)
            CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(icon, color: Colors.white),
              radius: 20,
            ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey),
                ),
                if (image != null) ...[
                  SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (String result) {
              // Xử lý lựa chọn
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Mark all reads',
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Mark all reads'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Remove all',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Remove all'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

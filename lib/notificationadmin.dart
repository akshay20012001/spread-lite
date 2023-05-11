import 'package:flutter/material.dart';

// Define a Notification model class
class NotificationModel {
  final String message;
  final DateTime timestamp;
  final String? imageUrl;

  NotificationModel(this.message, this.timestamp, {this.imageUrl});
}

// Define a list of sample notifications
final List<NotificationModel> _notifications = [
  NotificationModel("Welcome to our college's social media app!",
      DateTime.parse("2022-04-01 10:00:00")),
  NotificationModel("Don't forget to register for our upcoming hackathon!",
      DateTime.parse("2022-04-02 12:00:00")),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _currentIndex = 0;

  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  final _imageUrlController = TextEditingController();

  List<NotificationModel> _publishedNotifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Publish Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Published Notifications',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      return _buildPublishNotificationScreen();
    } else {
      return _buildPublishedNotificationsScreen();
    }
  }

  Widget _buildPublishNotificationScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Enter notification message',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                hintText: 'Enter image URL (optional)',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final message = _messageController.text.trim();
                  final imageUrl = _imageUrlController.text.trim();
                  final timestamp = DateTime.now();
                  final newNotification =
                      NotificationModel(message, timestamp, imageUrl: imageUrl);

                  setState(() {
                    _publishedNotifications.add(newNotification);
                  });

                  _messageController.clear();
                  _imageUrlController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Notification published successfully!'),
                  ));
                }
              },
              child: Text('Publish'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPublishedNotificationsScreen() {
    return ListView.builder(
      itemCount: _publishedNotifications.length,
      itemBuilder: (context, index) {
        final notification = _publishedNotifications[index];
        final formattedTimestamp = _formatTimestamp(notification.timestamp);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(notification.message),
            subtitle: Text(formattedTimestamp),
            trailing: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(notification.message),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Timestamp: $formattedTimestamp'),
                          if (notification.imageUrl != null)
                            Image.network(notification.imageUrl!),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final day = timestamp.day.toString().padLeft(2, '0');
    final month = timestamp.month.toString().padLeft(2, '0');
    final year = timestamp.year.toString();
    return '$day/$month/$year $hour:$minute';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class adminpage extends StatefulWidget {
  const adminpage({super.key});

  @override
  State<adminpage> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(6, (index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to a new page when the button is pressed
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ComplaintRegPage()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageRegPage()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RemovePostPage()),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RemoveUserPage()),
                      );
                      break;
                    case 4:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ComplaintStatusPage()),
                      );
                      break;
                    case 5:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommentPage()),
                      );
                      break;
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(8.0)),
                child: Text(
                  buttonText(index),
                  style: TextStyle(fontSize: 15),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  String buttonText(int index) {
    switch (index) {
      case 0:
        return 'Notification';
      case 1:
        return 'Faculty Access';
      case 2:
        return 'Page approval';
      case 3:
        return 'Complaint Registration';
      case 4:
        return 'Restrict User';
      case 5:
        return 'Feeds';
      default:
        return '';
    }
  }
}

class ComplaintRegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          'Post notifications here',
        ),
      ),
    );
  }
}

class PageRegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty access'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text('Give special access to faculty'),
      ),
    );
  }
}

class RemovePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page approval'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          'Admin can approve page here',
        ),
      ),
    );
  }
}

class RemoveUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restrict User'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          'You can restrict an user here',
        ),
      ),
    );
  }
}

class ComplaintStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restrict User'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          'Admin can restrict users here ',
        ),
      ),
    );
  }
}

class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          'The feed section for admin',
        ),
      ),
    );
  }
}

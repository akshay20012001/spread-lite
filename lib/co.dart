import 'package:flutter/material.dart';

class Complaint {
  final String title;
  final String status;
  final String details;

  Complaint({required this.title, required this.status, required this.details});
}

class ComplaintList extends StatelessWidget {
  final List<Complaint> complaints = [
    Complaint(
        title: 'Complaint 1', status: 'Pending', details: 'Reached C1 section'),
    Complaint(
        title: 'Complaint 2',
        status: 'Completed',
        details: 'This complaint is completed on dd/dd/yy \n remarks : nill'),
    Complaint(
        title: 'Complaint 3',
        status: 'Pending',
        details: 'Details unavailable.'),
    Complaint(
        title: 'Complaint 4',
        status: 'Completed',
        details: 'This complaint is completed on dd/dd/yy \n remarks : nill'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: complaints.length,
      itemBuilder: (context, index) {
        final complaint = complaints[index];
        return Card(
          child: ListTile(
            title: Text(complaint.title),
            subtitle: Text(complaint.status),
            trailing: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Details'),
                    value: complaint.details,
                  ),
                ];
              },
              onSelected: (value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Complaint Details'),
                      content: Text(value.toString()),
                      actions: <Widget>[
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
}

class ComplaintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
      ),
      body: ComplaintList(),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/globals.dart' as globals;

class NotificationMessages extends StatelessWidget {
  final String user = globals.userId;
  // final String title;
  final data;
  NotificationMessages(this.data);

  // final notifications = data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return buildCard(data[index]["title"], data[index]["body"]);
      },
    );
  }

  Widget buildCard(String subject, String description) {
    return Card(
      color: Colors.white,
//      margin: EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0, left: 16.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              subject,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0, bottom: 16.0),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

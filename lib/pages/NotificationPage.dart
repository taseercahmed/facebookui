import 'package:facebookui/Models/NotificationModel.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notification",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: IconButton(
                      icon: Icon(Icons.check_circle),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      tooltip: "Mark all Notification",
                      onPressed: () {
                        print("person Boutton Click");
                      },
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black26,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: notificationmodel.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(notificationmodel[index].avatorimg),
                          backgroundColor: Colors.blueGrey,
                        ),
                        title: Text(
                          notificationmodel[index].name +
                              "" +
                              ' ' +
                              notificationmodel[index].description,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          notificationmodel[index].time,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        trailing: IconButton(
                          iconSize: 20,
                          icon: Icon(Icons.more_vert_outlined),
                          onPressed: () {},
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => NotificationPage()),);
                        },
                      )
                    ],
                  )),
        )
      ],
    );
  }
}

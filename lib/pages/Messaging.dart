import 'package:facebookui/Models/Messagemodel.dart';
import 'package:flutter/material.dart';

class Messaging extends StatefulWidget {
  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
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
                "Messzage",
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
                      icon: Icon(Icons.message),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.green,
                      onPressed: () {
                        print("person Boutton Click");
                      },
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.redAccent,
                      onPressed: () {
                        print("people Boutton Click");
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
              itemCount: messagemodel.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(messagemodel[index].avatorimg),
                          backgroundColor: Colors.blueGrey,
                        ),
                        title: Text(
                          messagemodel[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          messagemodel[index].time,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        trailing: IconButton(
                          iconSize: 20,
                          icon: messagemodel[index].status,
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
    throw UnimplementedError();
  }
}

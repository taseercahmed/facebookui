import 'package:facebookui/Models/FriendModel.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
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
                "Friend",
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
                      icon: Icon(Icons.person),
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
                      icon: Icon(Icons.people),
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
              itemCount: friend.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(friend[index].avator),
                          backgroundColor: Colors.blueGrey,
                        ),
                        title: Text(
                          friend[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        trailing: Wrap(
                          spacing: 10,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Add Friend",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[600]),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Remove",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
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

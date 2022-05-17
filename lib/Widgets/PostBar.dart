import 'package:flutter/material.dart';

class PostBar extends StatefulWidget {
  @override
  State<PostBar> createState() => _PostBarState();
}

class _PostBarState extends State<PostBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          iconSize: 60,
          onPressed: () {},
          icon: CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage("images/boy.jpg"),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "What`s on your mind ?",
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ),
        Container(
          height: 60,
          child: VerticalDivider(
            color: Colors.black26,
          ),
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.photo_album_outlined),
            ),
            Text("Photo"),
          ],
        ),
      ],
    );
  }
}

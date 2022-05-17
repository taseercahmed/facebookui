import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.post_add_outlined),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ],
            )),
        Container(
          height: 40,
          child: VerticalDivider(
            color: Colors.black26,
            thickness: 1,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.video_call,
                  color: Colors.redAccent,
                ),
                Text(
                  "Live Video",
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ],
            )),
        Container(
          height: 40,
          child: VerticalDivider(
            color: Colors.black26,
            thickness: 1,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                ),
                Text(
                  "Location",
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ],
            )),
      ],
    );
    throw UnimplementedError();
  }
}

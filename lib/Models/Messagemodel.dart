import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageModel {
  final String name;
  final String avatorimg;
  final String time;
  final Icon status;
  static Icon statusonline = Icon(
    Icons.phone_android_outlined,
    size: 18,
    color: Colors.green,
  );
  static Icon statusofline = Icon(
    Icons.phone_android_outlined,
    size: 18,
    color: Colors.black26,
  );

  MessageModel(this.name, this.avatorimg, this.time, this.status);
}

List<MessageModel> messagemodel = [
  MessageModel("Adnan Adnan", "images/dawin.jpg", "16 min ago",
      MessageModel.statusofline),
  MessageModel("Adnan Adnan", "images/dawin.jpg", "16 min ago",
      MessageModel.statusonline),
  MessageModel(
      "Daniyal ", "images/Cute.jpg", "56 min ago", MessageModel.statusonline),
  MessageModel("H M  karichi", "images/girl.jpg", "16 min ago",
      MessageModel.statusofline),
  MessageModel(
      "Daniyal ", "images/jawad.jpg", "56 min ago", MessageModel.statusonline),
  MessageModel("H M  karichi", "images/girl.jpg", "16 min ago",
      MessageModel.statusofline),
];

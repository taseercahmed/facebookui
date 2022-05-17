import 'package:flutter/cupertino.dart';

class StoryModel {
  VoidCallback ontap;
  String image;
  String user;

  StoryModel(this.ontap, this.image, this.user);
}

List<StoryModel> storymodel = [
  StoryModel(() {
    print("taseer story click");
  }, "images/Taseeer.jpeg", "Taseer Ahmed"),
  StoryModel(() {
    print("jawad story click");
  }, "images/jawad.jpg", "Jawad"),
  StoryModel(() {
    print("dawin story click");
  }, "images/dawin.jpg", "Dawin"),
  StoryModel(() {
    print("Noman story click");
  }, "images/Cute.jpg", "Noman"),
  StoryModel(() {
    print("Root story click");
  }, "images/videoblocks.png", "Root Dawin"),
];

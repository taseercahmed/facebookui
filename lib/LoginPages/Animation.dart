import 'package:flutter/material.dart';
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool isanimate=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("vc uj"),
          AnimatedDefaultTextStyle(child: Text("Welcome in our app"),
              style:TextStyle(fontSize: 16,color: isanimate? Colors.black:Colors.deepOrangeAccent), duration: Duration(seconds: 60),
            curve: Curves.bounceInOut,
          ),
        ],
      ),
    );
  }
}

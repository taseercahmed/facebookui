import 'package:facebookui/screen/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
class ChatLayoutScreen extends StatefulWidget {
  const ChatLayoutScreen({Key? key}) : super(key: key);

  @override
  _ChatLayoutScreenState createState() => _ChatLayoutScreenState();
}

class _ChatLayoutScreenState extends State<ChatLayoutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,

       title: Row(
         children: [
           IconButton(
             icon: Icon(Icons.notification_important),
             onPressed: (){},),
          SizedBox(width: 80,),
           Center(child: Text('New way')),
           SizedBox(width: 5,),
         Align(


           child: Container(
             margin: EdgeInsets.symmetric(vertical: 20),
             decoration: BoxDecoration(

             shape: BoxShape.circle,
               color: Colors.green
             ),
             width: 13,
           height: 13,
           ),
         )


         ],
       ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatLayoutScreen()));
            },),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},),
        ],
      ),
      body: Center(child: Text('bjkvbd')),
    );
  }
}

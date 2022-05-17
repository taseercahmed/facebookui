




import 'package:facebookui/CallPages/Callutilities.dart';
import 'package:flutter/material.dart';
import 'Call Model.dart';
import 'Call_Method.dart';

class CallScreen extends StatefulWidget {
  final  Call call;

CallScreen({required this.call});




  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  CallMethod callMethod=CallMethod();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text('call has been made'),

            MaterialButton(
                child: Icon(Icons.call_end,color: Colors.white,),
                color: Colors.red,
                onPressed: (){


             callMethod.endcall(call:widget.call);
                Navigator.pop(context);
                }

            )
          ],
        ),
      ),
    );
  }
}


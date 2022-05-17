import 'package:facebookui/CallPages/Call%20Model.dart';
import 'package:facebookui/CallPages/CallScreen.dart';

import 'package:flutter/material.dart';

import 'Call_Method.dart';

class PickupScreen extends StatelessWidget{
  final  call;
  PickupScreen({required this.call,});//constructure for initialize,

  final CallMethod callMethod=CallMethod();


  @override
  Widget build(BuildContext context) {
 return Scaffold(
    body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('incomming',style: TextStyle(fontSize: 30),),
         SizedBox(height: 50,),
         Image.network(call.callerpic,height: 150,width: 150,),
         SizedBox(height: 30,),
         Text(call.callername,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         SizedBox(height: 75,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             IconButton(onPressed: ()async{
               await callMethod.endcall(call: call);

             }, icon: Icon(Icons.call_end,color: Colors.redAccent,),),
             SizedBox(width: 25,),
             IconButton(onPressed: ()=>Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>CallScreen(call:call))
             ),
               icon: Icon(Icons.call,color: Colors.green,),)
           ],
         )

       ],
      ),
    ),
 );


  }
}
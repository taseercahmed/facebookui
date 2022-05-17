import 'dart:math';

import 'package:facebookui/CallPages/CallScreen.dart';
import 'package:facebookui/CallPages/Call_Method.dart';
import 'package:facebookui/User/Userdetailmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Call Model.dart';

class Callutilies {
  static final CallMethod callMethod = CallMethod();

  static dial(
      {required UserDetailmodel from, required UserDetailmodel to, context}) async {

    Call call = Call(
      
      callerid: from.uid,
      callername: from.name,
      callerpic: from.profilePhoto,
      receiverid: to.uid,
      receiverpic: to.profilePhoto,
      receivername: to.name,
      channelid: Random().nextInt(1000).toString(), hasdiallled: null,

    );
    bool callmade = await callMethod.makecall(call: call);
    call.hasdiallled = true;
    if (callmade) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CallScreen(call: call)));
    }
  }

}
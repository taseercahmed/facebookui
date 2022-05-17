import 'package:flutter/material.dart';
class Call{

  String? callerid;
  String? callername;
  String? callerpic;
  String? receiverid;
  String? receivername;
  String? receiverpic;
  String? channelid;
  bool? hasdiallled;
  //hasdialled true for caller and false for reciever..

  Call({
    required this.callerid,
    required this.callername,
    required this.callerpic,
    required this.receiverid,
    required this.receivername,
    required this.receiverpic,
    required this.channelid,
    required this.hasdiallled
});

  //tomap

  Map<String,dynamic>tomap(Call call){
    Map<String,dynamic>callmap=Map();
    callmap['caller_id']=call.callerid;
    callmap['caller_name']=call.callername;
    callmap['caller_pic']=call.callerpic;
    callmap['receiver_id']=call.receiverid;
    callmap['receiver_name']=call.receivername;
    callmap['receiver_pic']=call.receiverpic;
    callmap['channel_id']=call.channelid;
    callmap['has_diallled']=call.hasdiallled;
    return callmap;
  }

         Call.fromMap(Map callmap){
          this.callerid=callmap['caller_id'];
          this.callername=callmap['caller_name'];
          this.callerpic=callmap['caller_pic'];
          this.receiverid=callmap['receiver_id'];
          this.receivername=callmap['receiver_name'];
          this.receiverpic=callmap['receiver_pic'];
          this.channelid=callmap['channel_id'];
          this.hasdiallled=callmap['has_diallled'];

      }
      }

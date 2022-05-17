import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  String? senderid;
  String? receiverid;
  String? photourl;
  String? type;
  String? message;
  FieldValue? timestamp;

  Message(this.senderid, this.receiverid,this.type,
      this.message, this.timestamp);
//will be only called when we used to send an image...
  Message.imagemessage(this.senderid,this.receiverid,this.photourl,this.type,this.message,this.timestamp);

     Map toMap (){
       var map=Map<String,dynamic>();
       map['senderid']=this.senderid;
       map['receiverid']=this.receiverid;
       map['type']=this.type;
       map['message']=this.message;
       map['timestamp']=this.timestamp;
       return map;

     }
     Message? fromMap(Map<String,dynamic>map){
       Message _message=Message(senderid,receiverid,type,message,timestamp);
       _message.senderid=map['senderid'];
       _message.receiverid=map['receiverid'];
       _message.type=map['type'];
       _message.message=map['message'];
       _message.timestamp=map['timestamp'];
       return _message;

     }

}
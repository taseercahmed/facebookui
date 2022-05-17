
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookui/CallPages/Callutilities.dart';

import 'package:facebookui/Models/Message.dart';

import 'package:facebookui/User/Userdetailmodel.dart';
import 'package:facebookui/pages/Messaging.dart';
import 'package:facebookui/resources/Firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ChatMessagingScreen extends StatefulWidget{
  final UserDetailmodel receiver;
  ChatMessagingScreen({required this.receiver});
  @override
  State<ChatMessagingScreen> createState() => _ChatMessagingScreenState();
}

class _ChatMessagingScreenState extends State<ChatMessagingScreen> {
  final TextEditingController textfieldcontroller=TextEditingController();
  final Firebaserepository _repository=Firebaserepository();
  late UserDetailmodel sender;
   User? user=FirebaseAuth.instance.currentUser;
  String? _currentuserid;
  bool iswriting=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _repository.getCurrentUser().then((user) {
   _currentuserid= user.currentUser!.uid;
   setState(() {
    sender=UserDetailmodel(

    );
   });



  } );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back),),

        title: Text('jbk '),
        actions: [
          IconButton(onPressed: (){
           Callutilies.dial(from:sender,to: widget.receiver,context: context);
          }, icon: Icon(Icons.video_call),),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone),),

        ],
      ),
      body: Column(
        children: [

          Expanded(child: messagelist()),
          chatcontroller(),
        ],
      ),
    );
  }
  Widget messagelist(){
    return StreamBuilder<QuerySnapshot>(
      //  stream:,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
      return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
       return chatmessageitem(snapshot.data!.docs[index]);
      });
    });
  }
  Widget chatmessageitem(DocumentSnapshot snapshot){

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
        child: Container(
        alignment: snapshot['senderid']==_currentuserid?
        Alignment.centerRight:Alignment.centerLeft,
        child: snapshot['senderid']==_currentuserid?senderlayout(snapshot):receiverlayout(snapshot),
      )
    );
  }
  Widget senderlayout(DocumentSnapshot snapshot){
    Radius messageradius=Radius.circular(10);
    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width*0.65,

      ),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topRight: messageradius,
          topLeft: messageradius,
          bottomLeft: messageradius,
        )
      ),
      child: Padding(padding: EdgeInsets.all(10),
      child:getmessage(snapshot),
      ),
    );
  }
  getmessage(DocumentSnapshot snapshot){
  return Text(snapshot['message']);
  }
  Widget receiverlayout(DocumentSnapshot snapshot){
    Radius messageradius=Radius.circular(10);
    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width*0.65,

      ),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topRight: messageradius,
            topLeft: messageradius,
            bottomLeft: messageradius,
          )
      ),
      child: Padding(padding: EdgeInsets.all(10),
      child: getmessage(snapshot),
      ),
    );
  }
  Widget chatcontroller(){

    setwritingto(bool val){
      setState(() {
        iswriting=val;
      });
    }

    sendmessage(){
      var text=textfieldcontroller.text;
      Message _message=Message(sender.uid, widget.receiver.uid,
          "text",
          text,
          FieldValue.serverTimestamp());
          setState(() {
          iswriting=false;

      });
       _repository.addMessagetoDb(_message,sender,widget.receiver,);
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(child: TextField(

            controller:textfieldcontroller,
            style: TextStyle(
              color: Colors.white,
            ),
            onChanged: (val){
              (val.length>0 && val.trim()!="")?setwritingto(true):setwritingto(false);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              filled: true,
              fillColor: Colors.blueGrey,
              suffixIcon: GestureDetector(
                onTap: (){},
                child: Icon(Icons.face),
              ),
              hintText: 'Type a message',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide.none
              ),

            ),

          )),
          iswriting?Container():Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.record_voice_over),
          ),
          iswriting?Container():Icon(Icons.camera_alt_sharp),
          iswriting?Container(margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,

          ),
            child: IconButton(onPressed: (){
              sendmessage();
            }, icon: Icon(Icons.send_sharp,size: 15,)),
          ):Container(),
        ],
      ),
    );
  }
  

}
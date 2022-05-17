import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
class ChatDetail extends StatefulWidget {
  const ChatDetail({Key? key, required this.friendname, required this.frienduid, }) : super(key: key);

  final  friendname;
  final  frienduid;
  @override
  _ChatDetailState createState() => _ChatDetailState(friendname,frienduid);
}

class _ChatDetailState extends State<ChatDetail> {
  final  friendname;
  final  frienduid;
   var data;
  final currentuseruid=FirebaseAuth.instance.currentUser!.uid;
 final TextEditingController _cuptinertext=TextEditingController();
  CollectionReference chat=FirebaseFirestore.instance.collection('chat');
  _ChatDetailState(this.friendname, this.frienduid);
  var chatdocumentid;
  @override
  void initState() {
        chat.where('users',isEqualTo: {currentuseruid:null,frienduid:null}).limit(1)
        .get().then((QuerySnapshot querySnapshot){
          if(querySnapshot.docs.isNotEmpty){
           chatdocumentid= querySnapshot.docs.single.id;
          }
          else{
            chat.add({
              'users':{
                frienduid:null,
                currentuseruid:null,
              }
            }).then((value)=>{
              chatdocumentid=value,

            });
          }
        }).catchError((e){});
    super.initState();
  }
  void sendmessage(String msg){
    if(msg=='')return;
    chat.doc(chatdocumentid).collection('messages').add({
      'createdon':FieldValue.serverTimestamp(),
      'msg':msg,
      'uid':currentuseruid,
    }).then((value) => _cuptinertext.text='');

  }
  bool issender(String friend){
    return friend==currentuseruid;
  }
  Alignment getalignment(friend){
    if(friend==currentuseruid){
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }
  @override
  Widget build(BuildContext context) {
   //final size=MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('chat').doc(chatdocumentid)
              .collection('messages').orderBy('createdon',descending: true).snapshots(),

          builder: (context,AsyncSnapshot <QuerySnapshot>snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text('Something went wrong'),
              );

            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: Text('Loading'),
              );
            }
            if(snapshot.hasData){

              //data=document.data()!;

              return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    previousPageTitle: 'Back',
                    middle: Text(friendname),
                    trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      child: Icon(CupertinoIcons.phone),


                    ),
                  ),
                  child:SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            reverse: true,
                            children:snapshot.data!.docs.map((DocumentSnapshot document){
                              data=document.data()!;

                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ChatBubble(
                                  clipper: ChatBubbleClipper6(
                                      nipSize: 0,
                                      radius: 0,
                                      type: BubbleType.receiverBubble),
                                  alignment: getalignment(data['uid'].toString(),),

                                  margin: EdgeInsets.only(top: 20),
                                  backGroundColor: issender(data['uid'])?Colors.blue:Colors.grey,
                                  child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(data['msg'].toString(),style: TextStyle(
                                                overflow: TextOverflow.ellipsis,color:

                                              issender(data['uid'].toString())? Colors.white:
                                              Colors.black,
                                              ),)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(data['createdon']==null?DateTime.now().toString()
                                                  :data['createdon']
                                                  .toDate().toString(),
                                                style: TextStyle(color: issender(data['uid'].toString())?
                                                Colors.white:Colors.black,
                                                    fontSize: 10),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              );




                            }).toList(),
                          ),
                        ),

                        Row(children: [

                          Expanded(
                            child: CupertinoTextField(
                          placeholder: 'Enter a message',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              controller: _cuptinertext,

                            ),
                          ),
                          CupertinoButton(child: Icon(Icons.send_sharp),
                              onPressed: ()=>sendmessage(_cuptinertext.text)),
                        ],),

                      ],
                    ),
                  ));
            }

            return Container();

          }
      ),
    );

  }

}

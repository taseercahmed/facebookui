import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookui/User/ChatDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UIDPage extends StatefulWidget {
  const UIDPage({Key? key}) : super(key: key);

  @override
  _UIDPageState createState() => _UIDPageState();
}

class _UIDPageState extends State<UIDPage> {
 var _currentuser=FirebaseAuth.instance.currentUser!.uid ;
 void callchatDetailscreen(BuildContext context,String name,String uid ){
   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatDetail(
       friendname: name,
       frienduid: uid,
   )
   ));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').where('uid',isNotEqualTo: _currentuser).snapshots(),

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
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text('chat'),
                ),
               SliverList(delegate: SliverChildListDelegate(snapshot.data!.docs.map((DocumentSnapshot document){
                 Map<String,dynamic>?data=document.data() as Map<String, dynamic>?;
                 return ListTile(
                   onTap: (){
                     callchatDetailscreen(context,data!['name'],data['uid']);
                   },
                   title: Text(data!['name']),
                   subtitle: Text(data['status']),
                 );
               }).toList()),)
              ],
            );
          }
          else{
            return Container(child: CircularProgressIndicator(),);
          }
        }
      )

    );
  }
}

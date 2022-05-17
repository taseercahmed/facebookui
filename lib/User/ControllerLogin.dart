

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookui/Models/Message.dart';
import 'package:facebookui/Models/user.dart';

import 'package:facebookui/User/Userdetailmodel.dart';
import 'package:facebookui/Widgets/LoginScreen.dart';

import 'package:facebookui/utils/Utilties.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerLogin with ChangeNotifier {
  var googlesigninNow = GoogleSignIn();
  final FirebaseAuth _auth=FirebaseAuth.instance;

  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  GoogleSignInAccount? googleSignInAccount;
String currentuid=FirebaseAuth.instance.currentUser!.uid;
  UserDetailmodel? userdetailmodel;
  String status='';
  String?  state;
 String username='';


  allowusertosignin() async {

    this.googleSignInAccount = await googlesigninNow.signIn();

    this.userdetailmodel = new UserDetailmodel(
        this.googleSignInAccount!.displayName,
        this.googleSignInAccount!.email,
        this.googleSignInAccount!.photoUrl,
      this.currentuid,
      this.status,
       this.state,
      this.username=Utils.getUsername(userdetailmodel?.email)
      );

    savetofirestore(userdetailmodel,);


   // notifyListeners();
  }

  alowusertologout() async {
    this.googleSignInAccount = await googlesigninNow.signOut();
    userdetailmodel = null;
    notifyListeners();
  }

  void savetofirestore(UserDetailmodel? userdetailmodel,)async{
     if(userdetailmodel!=null){
       await FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.uid).set(

           {
             "username":userdetailmodel.name,
             "email":userdetailmodel.email,
             "photo":userdetailmodel.profilePhoto.toString(),
              'uid':userdetailmodel.uid,
              'status':null,
             'state':null,
             'username':username,


           }
       ).then((value){
         print("successfullcnmnc");
        //Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreens()));
         notifyListeners();
       }).onError((error, stackTrace){
         print("failedfgf");
         //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:(Text("Successfully created")),));
       });
     }
    //  notifyListeners();
  }
  Future<User?> getCurrentUser() async {
    User? currentUser;
    currentUser = await _auth.currentUser;
    return currentUser;
  }
  Future<List<Users>> fetchAllUsers(User currentUser) async {
    List<Users> userList = <Users>[];

    QuerySnapshot querySnapshot =
    await _firestore.collection("users").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.uid) {
        userList.add(Users.fromMap(querySnapshot.docs[i].data));
      }
    }
    return userList;
  }

  Future<DocumentReference<Map<String, dynamic>>>addMessagetoDb(Message message,UserDetailmodel sender,receiver)
  async{


    var map=message.toMap();
    await _firestore.collection('messages').
    doc(message.senderid).
    collection(message.receiverid.toString())
        .add(map as Map<String,dynamic>);

    return await _firestore.collection('messages')
        .doc(message.receiverid).collection(message.senderid.toString())
        .add(map as Map<String,dynamic>);
  }
}




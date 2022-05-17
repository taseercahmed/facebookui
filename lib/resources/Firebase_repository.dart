import 'package:facebookui/Models/Message.dart';
import 'package:facebookui/User/ControllerLogin.dart';
import 'package:facebookui/User/Userdetailmodel.dart';
import 'package:facebookui/resources/Firebase_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebaserepository{
  FirebaseMethod _firebaseMethod=FirebaseMethod();
    ControllerLogin _firebasecont=ControllerLogin();
    Future getCurrentUser()=>_firebasecont.getCurrentUser();
  Future signIn()=>_firebaseMethod.signIn();
  Future<bool>authenticateuser(User user)=>_firebaseMethod.authenticateuser(user);
 Future<void>addDatatoDb(User user)=>_firebaseMethod.addDatatoDb(user);
 Future<List>fetchallUser(User user)=>_firebasecont.fetchAllUsers(user);
 Future<void>addMessagetoDb(Message message,UserDetailmodel sender,receiver)=>
     _firebasecont.addMessagetoDb(message,sender,receiver,);
}
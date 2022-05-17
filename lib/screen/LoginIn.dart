import 'package:facebookui/resources/Firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Homescreens.dart';
class LoginIn extends StatefulWidget {
  const LoginIn({Key? key}) : super(key: key);

  @override
  _LoginInState createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  Firebaserepository _repository=Firebaserepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: loginButton()),
    );
  }
  Widget loginButton(){
    return ElevatedButton(onPressed: ()=> perforormlogin,
        child:Text('Login In',style: TextStyle(letterSpacing: 10,fontSize: 20,),));
  }
  void perforormlogin(){
  _repository.signIn().then((user){
    if(user!=null){
      authenticateuser(user);
      print('jdhv'+user.toString() );
    }
    else{
      print('There was an error ');
    }
  });
  }
  void authenticateuser(user){
      _repository.authenticateuser(user).then((isnewuser) {
        if(isnewuser){
          _repository.addDatatoDb(user).then((value){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreens()));
          });
        }
        else{
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreens()));
        }
      });
  }
}

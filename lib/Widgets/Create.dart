import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Create(email, password) async {
  email = email;
  password = password;

  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseException catch (e) {
    if (e.code == '6') {
      print("Your Password is less than 6 ");
    } else if (e.code == 'email-already-in-use') {
      print("This email is already use please change your email");
    }
  } catch (e) {
    print(e);
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
//  Login(email,password)async{
// email=email;
// password=password;
// try{
//   UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email, password: password);
// } on FirebaseException catch(e){
//   if(e.code=='6'){
//     print("Your Password is less than 6 ");
//   }
//   else if(e.code=='email-already-in-use'){
//     print("This email is already use please change your email");
//   }
//
// }
// catch(e){
//   print(e);
// }
// }

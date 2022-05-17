import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> Create(String email, password, BuildContext context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      showsnackbar("sucessfully", context);
    } else {
      showsnackbar("failded login", context);
    }
  } on FirebaseException catch (e) {
    if (e.code == '5') {
      print("Your Password is less than 5 ");
      showsnackbar("Your Password is less than 6", context);
    } else if (e.code == 'email-already-in-use') {
      showsnackbar(
          "This email is already use please change your email", context);
      print("This email is already use please change your email");
    }
  } catch (e) {
    print(e);
  }
}

void showsnackbar(String msg, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

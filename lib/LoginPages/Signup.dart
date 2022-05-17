import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookui/LoginPages/Login.dart';

import 'package:facebookui/User/UIDPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var name = '';
  var confirmpassword = '';
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final confirmcontrller = TextEditingController();
  final namecontrller = TextEditingController();

  @override
  dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmcontrller.dispose();
    namecontrller.dispose();
    super.dispose();
  }
  FirebaseAuth _auth=FirebaseAuth.instance;
  CollectionReference _usernew=FirebaseFirestore.instance.collection('users');

  //firbase function

  // registration() async {
  //   if (password == confirmpassword) {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //             User? user=userCredential.user;
  //          await Databasemodel(uid: user!.uid).Updatauserdata("hello", "pakisfj",15);
  //       print(userCredential);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.blueGrey,
  //           content: Text(
  //             "Registered Successfully,Please Signin",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //         ),
  //       );
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Loginpagess(),
  //           ));
  //     } on FirebaseException catch (error) {
  //       if (error.code == 'weak-password') {
  //         print("Your password is so weak");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Colors.amberAccent,
  //             content: Text(
  //               "Your password is so weak ",
  //               style: TextStyle(fontSize: 16),
  //             ),
  //           ),
  //         );
  //       } else if (error.code == 'email-already-in-use') {
  //         print("Account is  already exist");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Colors.amberAccent,
  //             content: Text(
  //               "Account is already exist ",
  //               style: TextStyle(fontSize: 16),
  //             ),
  //           ),
  //         );
  //       }
  //     }
  //   } else {
  //     print("Password and confirm password  does not match");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.amberAccent,
  //         content: Text(
  //           "Password and confirm password  does not match",
  //           style: TextStyle(fontSize: 16),
  //         ),
  //       ),
  //     );
  //   }
  // }
 void Createuserinfofirestore()async{
    _usernew.where('uid', isEqualTo: _auth.currentUser!.uid).limit(1).get().then((QuerySnapshot querySnapshot) {

      if(querySnapshot.docs.isEmpty){
        _usernew.add({
          'name':name,
           'email':_auth.currentUser!.email,
          'status':'Available',
          'uid':_auth.currentUser!.uid

        });
      }
    } );
  }
  create()async{
    try{
      
      User? user=(await _auth.createUserWithEmailAndPassword(email: email, password: password)).
      user;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UIDPage ()));

      user!.updateDisplayName(name);
      Createuserinfofirestore();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UIDPage(),
          ));
    }catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: Image(
                    image: AssetImage("images/signup.jpg"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    //  autofocus: false,
                    decoration: InputDecoration(
                      labelText: "Please enter yoyr email Here",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(
                          fontSize: 14, color: Colors.deepOrangeAccent),
                    ),
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!value.contains('@')) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    //  autofocus: false,
                    decoration: InputDecoration(
                      labelText: "name",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(
                          fontSize: 14, color: Colors.deepOrangeAccent),
                    ),
                    controller: namecontrller,

                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(
                          fontSize: 14, color: Colors.deepOrangeAccent),
                    ),
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: " Confirm Password",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(
                          fontSize: 14, color: Colors.deepOrangeAccent),
                    ),
                    controller: confirmcontrller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter confirm password";
                      }

                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              email = emailcontroller.text;
                              password = passwordcontroller.text;
                              confirmpassword = confirmcontrller.text;
                              name=namecontrller.text;
                            });
                          }
                         create();
                        },
                        child: Text(
                          "Rigester Now",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )),
                  ],
                ),


                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpagess()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.deepOrangeAccent,
                                fontFamily: "Roboto-Regular"),
                          )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

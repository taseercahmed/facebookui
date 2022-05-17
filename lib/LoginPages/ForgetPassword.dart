import 'package:facebookui/LoginPages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Signup.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var email = '';
  final emailcon = TextEditingController();
  final forgetkey = GlobalKey<FormState>();

  resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully send password to your email"),
        ),
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Loginpagess()));
    } on FirebaseException catch (error) {
      if (error.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Account not exist on this email"),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Image(
              height: 200,
              image: AssetImage('images/forget.png'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "Rest Link will send your email ID",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Container(
            height: 400,
            child: Form(
                key: forgetkey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          controller: emailcon,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email first";
                            } else if (!value.contains('@')) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (forgetkey.currentState!.validate()) {
                                  setState(() {
                                    email = emailcon.text;
                                  });
                                }
                                resetpassword();
                              },
                              child: Text(
                                "Send Email",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Loginpagess()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don`t have an account ?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                },
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

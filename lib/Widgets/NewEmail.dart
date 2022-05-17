import 'package:facebookui/pages/LoginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Create.dart';

class NewEmail extends StatefulWidget {
  @override
  State<NewEmail> createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
  final _fieldtext = TextEditingController();
  final _fieldpassword = TextEditingController();
  final _fieldemail = TextEditingController();

  String username = "";

  String useremail = '';

  String userpassword = '';

  void getcode() {
    _fieldtext.clear();
    _fieldemail.clear();
    _fieldpassword.clear();
  }

  bool isobscure = true;
  Icon icon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 5,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_sharp),
                ),
                Text(
                  "Back",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Signup",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "signup to join",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 21, color: Colors.black),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Please type full name",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      controller: _fieldtext,
                      onChanged: (value) {
                        username = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 21, color: Colors.black),
                    ),
                    TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        // prefix: Icon(Icons.email,color: Colors.deepOrange,),
                        hintText: "Please enter your email Here",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      controller: _fieldemail,
                      onChanged: (value) {
                        useremail = value;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 21, color: Colors.black),
                    ),
                    TextField(
                      autocorrect: true,
                      obscureText: isobscure,
                      decoration: InputDecoration(
                        hintText: "Password",
                        // prefix: Icon(Icons.lock,),
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                        filled: true,
                        fillColor: Colors.white70,
                        // suffix: IconButton(
                        // splashColor: Colors.transparent,
                        // highlightColor: Colors.transparent,
                        // onPressed: (){
                        //
                        //   setState(() {
                        //     if(isobscure){
                        //       isobscure=false;
                        //       // Icon(Icons.visibility,color: Colors.deepOrangeAccent,);
                        //
                        //
                        //     }
                        //     else{
                        //       isobscure=true;
                        //       // Icon(Icons.visibility_off,color: Colors.deepOrange,);
                        //     }
                        //   });
                        // }, icon: Icon(isobscure?Icons.visibility_off:Icons.visibility,color: Colors.deepOrange,),),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      controller: _fieldpassword,
                      onChanged: (value) {
                        userpassword = value;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(child: Divider()),
                    //     SizedBox(width: 30,),
                    //     Text("OR Sign in with",style:TextStyle(fontSize: 16,color: Colors.black ,)),
                    //     SizedBox(width: 30,),
                    //     Expanded(child: Divider()),
                    //   ],
                    // )

                    Center(
                      child: SizedBox(
                        // height: 100,
                        width: 500,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            getcode();
                            Create(useremail, userpassword);
                          },
                          child: Text(
                            "Register Now",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),

                    TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.deepOrange),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()),
                                        );
                                      }),
                              ]),
                        )),
                  ]),
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

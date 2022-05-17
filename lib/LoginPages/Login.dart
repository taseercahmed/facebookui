import 'package:facebookui/LoginPages/ForgetPassword.dart';
import 'package:facebookui/LoginPages/Signup.dart';
import 'package:facebookui/LoginPages/mains.dart';
import 'package:facebookui/User/ControllerLogin.dart';
import 'package:facebookui/Widgets/Create.dart';
import 'package:facebookui/screen/Homescreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpagess extends StatefulWidget {


  @override
  State<Loginpagess> createState() => _LoginpagessState();
}

class _LoginpagessState extends State<Loginpagess> {
  final formkey = GlobalKey<FormState>();
  final useremail = TextEditingController();
  final userpassword = TextEditingController();

  var email = '';
  var password = '';

  @override
  Future<void> dispose() async {
    useremail.dispose();
    userpassword.dispose();
    super.dispose();
  }

  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserMain()));
    } on FirebaseException catch (error) {
      if (error.code == 'user-not-found') {
        print("No user found in this email");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user found in this email",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )));
      } else if (error.code == 'wrong-password') {
        print("Wrong Password provider by the user");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong Password provider by the user",
              style: TextStyle(fontSize: 15, color: Colors.white),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Image(image: AssetImage("images/login.jpg")),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  //  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Please enter yoyr email Here",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
                  ),
                  controller: useremail,
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
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
                  ),
                  controller: userpassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
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
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            email = useremail.text;
                            password = userpassword.text;
                          });
                        }
                        userlogin();
                        showLoaderDialog(context);
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          primary: Colors.deepOrangeAccent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()));
                      },
                      child: Text(
                        "Forget password?",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      // style: TextButton.styleFrom(
                      //   textStyle: TextStyle(
                      //       fontSize: 20,
                      //       wordSpacing: 5
                    ),
                  ],
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Don`t have an account  ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Roboto-Regular"),
                      children: [
                        TextSpan(
                            text: "SignUp",
                            style: TextStyle(
                                fontSize: 18, color: Colors.deepOrangeAccent),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ),
                                );
                              })
                      ]),
                ),
              ),

              // Googlesignin(),
              GestureDetector(
                child: Image(image: AssetImage("images/googlebtn.jpg"),width: 80,height: 80,),
                onTap: () {
                   Gotogoogle(context);
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreens()));
                  },
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Image(image: AssetImage("images/facebook.jpg",),height: 90,width: 90,),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )

          // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 60),

          ),
    );
  }

  void Gotogoogle(BuildContext context) {
    Provider.of<ControllerLogin>(context, listen: false).allowusertosignin();
  }
}

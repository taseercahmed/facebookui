import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupLoginScreen extends StatefulWidget {
  @override
  State<SignupLoginScreen> createState() => _SignupLoginScreenState();
}

class _SignupLoginScreenState extends State<SignupLoginScreen> {
  bool issignupscreen = true;
  bool ismale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Positioned(
              top: 20,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/natural.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Welcome to",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.yellow[700],
                                letterSpacing: 2),
                            children: [
                              TextSpan(
                                text: "Facebook",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.yellow[700],
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Signup to continue",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ),
              )),

          //positioned for login and signup......
          Positioned(
              top: 120,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 400,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 5,
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              issignupscreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Login ",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: !issignupscreen
                                        ? Colors.black
                                        : Colors.orange,
                                    letterSpacing: 2),
                              ),
                              if (!issignupscreen)
                                Container(
                                  height: 2,
                                  width: 90,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("ok okkkkkkk");
                            setState(() {
                              issignupscreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Signup ",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: issignupscreen
                                        ? Colors.black
                                        : Colors.orange,
                                    letterSpacing: 2),
                              ),
                              if (issignupscreen)
                                SizedBox(
                                  height: 3,
                                ),
                              Container(
                                height: 2,
                                width: 90,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "username",
                              prefixIcon: Icon(
                                Icons.people_outlined,
                                color: Colors.cyan,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "enter your email",
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "enter Password",
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("ok nbut");
                                  setState(() {
                                    ismale = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: ismale
                                              ? Colors.grey
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: ismale
                                                ? Colors.transparent
                                                : Colors.grey,
                                            width: 1,
                                          )),
                                      child: Icon(
                                        Icons.people_outlined,
                                        color: ismale
                                            ? Colors.deepOrangeAccent
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: ismale
                                              ? Colors.black
                                              : Colors.orange),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ismale = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ismale
                                                ? Colors.grey
                                                : Colors.transparent,
                                            border: Border.all(
                                              width: 1,
                                              color: ismale
                                                  ? Colors.transparent
                                                  : Colors.grey,
                                            )),
                                        child: Icon(
                                          Icons.people_outlined,
                                          color: ismale
                                              ? Colors.deepOrangeAccent
                                              : Colors.grey,
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Female",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: ismale
                                                ? Colors.orange
                                                : Colors.black)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, left: 40, right: 20),
                            child: RichText(
                              text: TextSpan(
                                  // recognizer: TapGestureRecognizer()..onTap=(){
                                  // print("object");
                                  // },
                                  text: "By pressing submit you agree to our  ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: "term & condition",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.yellow),
                                    ),
                                  ]),
                            ),
                          ),
                          // SizedBox(height: 5,),
                        ],
                      ),
                    )
                  ],
                ),
              )),

          //trick to add submit button
          //

          Positioned(
            top: 530,
            left: 0,
            right: 0,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          //Linear Gradient takes a list of colors.....
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ]),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        )
                      ]),
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}

import 'package:flutter/material.dart';

class Emaillogin extends StatefulWidget {
  @override
  State<Emaillogin> createState() => _EmailloginState();
}

class _EmailloginState extends State<Emaillogin> {
  final fieldtext = TextEditingController();
  final fieldemail = TextEditingController();
  final fieldpassword = TextEditingController();
  final fieldrepassword = TextEditingController();
  String email = '';
  String password = '';

  String repassword = '';
  bool isobscure = true;
  bool repasswordobscure = true;

  void cleartext() {
    fieldtext.clear();
    fieldemail.clear();
    fieldpassword.clear();
    fieldrepassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  )),
              Text(
                "Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Signup",
                  textAlign: TextAlign.left,
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Signup to join",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    throw UnimplementedError();
  }
}

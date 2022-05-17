import 'package:facebookui/LoginPages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Changepass extends StatefulWidget {
  const Changepass({Key? key}) : super(key: key);

  @override
  _ChangepassState createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {
  final resetkey = GlobalKey<FormState>();
  var resetpassword = '';
  final resetcontroller = TextEditingController();

  @override
  void dispose() {
    resetcontroller.dispose();
    super.dispose();
  }

  //for updatepassword firbaseauth.....
  changepassword() async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(resetpassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Loginpagess(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Your password has been changed successful... Login again")));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: resetkey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image(
                  image: AssetImage("images/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    labelText: "Enter your new password",
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorStyle: TextStyle(fontSize: 17, color: Colors.blueGrey),
                  ),
                  controller: resetcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (resetkey.currentState!.validate()) {
                    setState(() {
                      resetpassword = resetcontroller.text;
                    });
                    changepassword();
                  }
                },
                child: Text(
                  "change password",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

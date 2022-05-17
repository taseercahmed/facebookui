import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fieldemail = TextEditingController();
  final fieldpassword = TextEditingController();

  String email = '';

  String userpassword = '';

  void cleartext() {
    // fieldtext.clear();
    fieldemail.clear();
    fieldpassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  "Back",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Login to Account",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto-Regular',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter Information Below to Login Your Account",
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Your email",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not`use @ char please use it '
                      : null;
                },
                controller: fieldemail,
                onChanged: (value) {
                  email = value;
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              " Password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              controller: fieldpassword,
              onChanged: (value) {
                userpassword = value;
              },
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget password?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black26),
                  ),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20, wordSpacing: 5),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (fieldemail.text.contains('@')) {
                } else {}

                cleartext();

                // Login(userpassword,email);
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 17, color: Colors.black26),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                icon: Icon(Icons.facebook_rounded),
                label: Text("Login with Google")),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                label: Text("Login with Facebook"),
                icon: Icon(Icons.facebook))
          ],
        ),
      ),
    );
  }
}

import 'package:facebookui/LoginPages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;
final email = FirebaseAuth.instance.currentUser!.email;
final currenttime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

User? user = FirebaseAuth.instance.currentUser;

verifyemail(BuildContext context) async {

  if (user != null && user!.emailVerified) {
    await user!.sendEmailVerification();

    print("Verification Email has been sent");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("sent sucessfully")));

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
    //
    // Text("Verification Email has been sent"),),);
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage("images/profile.jpg"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  "UID",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  uid,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  "Email : $email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                user!.emailVerified
                    ? Text(
                        "verified",
                        style:
                            TextStyle(fontSize: 18, color: Colors.amberAccent),
                      )
                    : TextButton(
                        onPressed: () => {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("it is working this"))),
                              verifyemail(context),
                            },
                        child: Text(
                          "Verify Email",
                          style: TextStyle(
                              fontSize: 22, color: Colors.deepOrangeAccent),
                        )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  "Created",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  currenttime.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loginpagess(),
                      ),
                      (route) => false);
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )),
          ],
        ));
  }
}

import 'package:facebookui/User/ControllerLogin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Googlesignin extends StatefulWidget {
  const Googlesignin({Key? key}) : super(key: key);

  @override
  _GooglesigninState createState() => _GooglesigninState();
}

loginurlcontroller() {
  return Consumer<ControllerLogin>(
    builder: (context, model, child) {
      // if user already login
      if (model.userdetailmodel != null) {
        return Center(
          //show user details
          child: alreadyuserlogin(model, context),
        );
      }
      //if user not already login
      else {
        return notloginscreen(context);
      }
    },
  );
}

notloginscreen(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Image(
            image: AssetImage("images/google.jpg"),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Provider.of<ControllerLogin>(context, listen: false)
            //     .allowusertosignin();
          },
          child: Container(
            child: Row(
              children: [
                Image(
                  image: AssetImage("images/google-plus.png"),
                ),
                Text(
                  "Sign with google",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

alreadyuserlogin(ControllerLogin model, context) {
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundImage:
            Image.network(model.userdetailmodel!.profilePhoto?? "").image,
        radius: 100,
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            model.userdetailmodel!.name ?? "",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.email,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            model.userdetailmodel!.email ?? "",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      ActionChip(
          avatar: Padding(
            padding: EdgeInsets.only(left: 15, right: 20),
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          label: Text(
            "Logout",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Provider.of<ControllerLogin>(context, listen: false)
                .alowusertologout();
          })
    ],
  );
}

class _GooglesigninState extends State<Googlesignin> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ControllerLogin()),
        ],
        child: Scaffold(
          body: loginurlcontroller(),
        ));
  }
}

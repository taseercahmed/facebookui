
import 'package:facebookui/CallPages/Pickupscreen.dart';
import 'package:facebookui/LoginPages/Login.dart';
import 'package:facebookui/User/ControllerLogin.dart';
import 'package:facebookui/screen/ChatMessagingScreen.dart';
import 'package:facebookui/screen/Homescreens.dart';
import 'package:facebookui/screen/Search.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/LoginIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ControllerLogin()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          ' search_screen':(context)=> SearchScreen(),
        },
        title: 'Facebook',
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Loginpagess(),
      ),
    );
  }
}

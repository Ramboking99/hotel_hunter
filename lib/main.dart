import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotelhunter/Models/appConstants.dart';
import 'package:hotelhunter/Screens/bookPostingPage.dart';
import 'package:hotelhunter/Screens/conversationPage.dart';
import 'package:hotelhunter/Screens/createPostingPage.dart';
import 'package:hotelhunter/Screens/guestHomePage.dart';
import 'package:hotelhunter/Screens/hostHomePage.dart';
import 'package:hotelhunter/Screens/loginPage.dart';
import 'package:hotelhunter/Screens/personalInfoPage.dart';
import 'package:hotelhunter/Screens/signUpPage.dart';
import 'package:hotelhunter/Screens/viewPostingPage.dart';
import 'package:hotelhunter/Screens/viewProfilePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        GuestHomePage.routeName: (context) => GuestHomePage(),
        PersonalInfoPage.routeName: (context) => PersonalInfoPage(),
        ViewProfilePage.routeName: (context) => ViewProfilePage(),
        BookPostingPage.routeName: (context) => BookPostingPage(),
        ConversationPage.routeName: (context) => ConversationPage(),
        HostHomePage.routeName: (context) => HostHomePage(),
        CreatePostingPage.routeName: (context) => CreatePostingPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Timer(Duration(seconds: 2),() {
      Navigator.pushNamed(context, LoginPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.hotel,
              size: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                  '${AppConstants.appName}',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 40,
                   ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

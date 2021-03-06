import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotelhunter/Models/appConstants.dart';
import 'package:hotelhunter/Models/data.dart';
import 'package:hotelhunter/Models/userObjects.dart';
import 'package:hotelhunter/Screens/guestHomePage.dart';
import 'package:hotelhunter/Screens/signUpPage.dart';

class LoginPage extends StatefulWidget {

  static final String routeName = '/loginPageRoute';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    if(_formKey.currentState.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      AppConstants.currentUser = User();
      AppConstants.currentUser.email = email;
      AppConstants.currentUser.password = password;
      Navigator.pushNamed(context, SignUpPage.routeName);
    }
  }

  void _login() {
    if(_formKey.currentState.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((firebaseUser) {
        String userID = firebaseUser.user.uid;
        AppConstants.currentUser = User(id: userID);
        AppConstants.currentUser.getPersonalInfoFromFirestore().whenComplete(() {
          Navigator.pushNamed(context, GuestHomePage.routeName);
        });
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome to ${AppConstants.appName}!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email'
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if(!text.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            controller: _emailController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password'
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            obscureText: true,
                            validator: (text) {
                              if(text.length < 8) {
                                return 'Password must be atleast 8 characters long';
                              }
                              return null;
                            },
                            controller: _passwordController,
                          ),
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: MaterialButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    color: Colors.blue,
                    height: MediaQuery.of(context).size.height /15,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: MaterialButton(
                    onPressed: () {
                      _signUp();
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    ),
                    color: Colors.grey,
                    height: MediaQuery.of(context).size.height /15,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

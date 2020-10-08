import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import 'package:bus_ticket_app/widget/features_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.teal,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.only(top: 40, bottom: 30, right: 15, left: 15),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    height: 80.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Welcome Buddies,',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login/Register to book your seat!',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Login to your account',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kdecorationTextField.copyWith(
                              hintText: 'Email Address'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kdecorationTextField.copyWith(
                              hintText: 'Password'),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/reset');
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.teal,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        ButtonWidget(
                          label: 'Login',
                          onPress: () async {
                            await Firebase.initializeApp();
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final newUser =
                                  await auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushNamed(context, '/home');
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              setState(() {
                                showSpinner = false;
                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('$e'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Close'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      )
                                    ],
                                  );
                                },
                              );
                              print(e);
                            }
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Divider(
                              height: 1,
                              indent: 10,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10.0),
                              child: Text(
                                'Or',
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: GestureDetector(
                            child: Text(
                              'Don\'t have an account? Sign up here.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.teal,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

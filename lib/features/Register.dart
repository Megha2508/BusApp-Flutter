import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bus_ticket_app/widget/constants.dart';
import 'package:bus_ticket_app/widget/features_widget.dart';

TextFieldWidget textFieldWidget = TextFieldWidget();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String email;
  String password;
  String confirmPassword;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Register yourself',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 25.0),
          ),
          backgroundColor: Colors.teal,
          elevation: 10.0,
        ),
        backgroundColor: Colors.teal,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 40.0,
                                top: 70.0,
                                right: 40.0,
                                bottom: 3.0),
                            child: TextField(
                              onChanged: (value) {
                                name = value;
                              },
                              decoration: kdecorationTextField.copyWith(
                                hintText: 'Full name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 3.0),
                            child: TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: kdecorationTextField.copyWith(
                                hintText: 'Email address',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 3.0),
                            child: TextField(
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: kdecorationTextField.copyWith(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              obscureText: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 3.0),
                            child: TextField(
                              onChanged: (value) {
                                confirmPassword = value;
                              },
                              decoration: kdecorationTextField.copyWith(
                                hintText: 'Confirm Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              obscureText: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
                  child: ReusableButton(
                    label: 'Register',
                    onPress: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        await Firebase.initializeApp();
                        final newUser =
                            await auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, '/');
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_interface/firstLogin.dart';
import 'package:login_interface/food_decision.dart';
import 'package:login_interface/login.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constant.dart';

void main() {
  runApp(register());
}

class register extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool _isButtonPressed = false;
  String? email;
  String? password;

  //Create a private FirebaseAuth instance
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, Login.id);
          },
        ),
        backgroundColor: kAppBarColor,
        title: Text(
          'Food Decision',
          style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/street.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Opacity(
            opacity: 0.6, // 60% opacity
            child: Container(
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create your new account below',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Your email...',
                      ),
                      //Receive email value
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          var userRegistered =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email!, password: password!);

                          if (userRegistered != null) {
                            setState(() {
                              _isButtonPressed = !_isButtonPressed;
                            });
                            Navigator.pushNamed(context, FirstLogin.id);
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-email') {
                            // show error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Invalid email format. Please enter a valid email address.'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          } else if (e.code == 'email-already-in-use') {
                            // show error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'This email is already registered. Please use a different email address.'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          } else {
                            // show generic error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'An error occurred while registering: ${e.message}'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          }
                        } catch (e) {
                          // show generic error message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'An error occurred while registering: $e'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isButtonPressed ? Colors.green : Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

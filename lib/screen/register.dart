import 'package:flutter/material.dart';
import 'package:login_interface/screen/firstLogin.dart';
import 'package:login_interface/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_interface/component/constant.dart';

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
      //Used to stack widgets on top of each other. In this case, it is used to stack two container widgets.
      body: Stack(children: [
        Container(
          //Used to decorate the container widget with an image as its background.
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/dinner.jpg'),
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
              //creates a circular border radius with a radius of 20.
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              //sets a padding of 50 pixels on all sides of the Container widget's child.
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: kTitleStyle.copyWith(
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
                      style: kTitleStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    //allows the user to enter their email address.
                    child: TextFormField(
                      style: kTitleStyle.copyWith(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Your email...',
                      ),
                      //Receive email value
                      //gets called every time the user types something into the field.
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    //allows the user to enter their password.
                    child: TextFormField(
                      style: kTitleStyle.copyWith(
                        fontSize: 14,
                      ),
                      //set to true to hide the entered text
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      //The onChanged property specifies a function to be called when the user enters or changes the password value, and updates the password variable accordingly.
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  SizedBox(
                    //set the width of a widget to fill the available space.
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
                          //catch exception of invalid email format
                          if (e.code == 'invalid-email') {
                            // show error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              //appears at the bottom of the screen
                              SnackBar(
                                content: Text(
                                    'Invalid email format. Please enter a valid email address.'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                            //catch exception of email has already been registered
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
                            // show generic error message to the user when there is an error occurred while registering.
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
                        style: kTitleStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      //ElevatedButton widget based on the boolean value of _isButtonPressed variable. If _isButtonPressed is true, the background color will be set to Colors.green, otherwise, it will be set to Colors.blue
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isButtonPressed ? Colors.green : kAppBarColor,
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

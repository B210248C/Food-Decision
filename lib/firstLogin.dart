import 'package:flutter/material.dart';
import 'package:login_interface/food_decision.dart';
import 'package:login_interface/home.dart';
import 'package:login_interface/login.dart';
import 'register.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constant.dart';

class FirstLogin extends StatefulWidget {
  static String id = 'first_login_screen';
  @override
  _FirstLoginState createState() => _FirstLoginState();
}

class _FirstLoginState extends State<FirstLogin> {
  bool _isButtonPressed = false;
  String? email;
  String? password;

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
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
                      'Welcome Back,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Access your account below or',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        //By pressing this text button, it will navigate to the register page.
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => register()),
                            );
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ),

                      ],
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
                      //Receive password value
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
                          var userLoggedIn =
                              await _auth.signInWithEmailAndPassword(
                                  email: email!, password: password!);
                          if (userLoggedIn != null) {
                            setState(() {
                              _isButtonPressed = !_isButtonPressed;
                            });
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            // show error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'There is no user record corresponding to this email. The user may have been deleted.'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          } else {
                            // show generic error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'An error occurred while logging in: ${e.message}'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          }
                        } catch (e) {
                          // show generic error message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'An error occurred while logging in: $e'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Login',
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
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      //For guest, when clicking on this text button it will directly navigate to the home page without login needed.
                      child: Text(
                        'Continue as a guest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
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

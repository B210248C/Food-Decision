import 'package:flutter/material.dart';
import 'package:login_interface/screen/home.dart';
import 'package:login_interface/screen/login.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_interface/component/constant.dart';

class FirstLogin extends StatefulWidget {
  static String id = 'first_login_screen';
  @override
  _FirstLoginState createState() => _FirstLoginState();
}

class _FirstLoginState extends State<FirstLogin> {
  bool _isButtonPressed = false;
  String? email;
  String? password;

//provides methods for handling user authentication, such as signing up, signing in, and signing out users, as well as getting information about the current user.
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
          //Used to decorate the container widget with an image as its background.
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/dinner.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Opacity(
            opacity: 0.5, // 50% opacity
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
              //sets a padding of 50 pixels on all sides of the Container widget's child.
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back,',
                      style: kTitleStyle.copyWith(
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
                          style: kTitleStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        //By pressing this text button, it will navigate to the register page.
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register()),
                            );
                          },
                          child: Text(
                            'Create Account',
                            style: kTitleStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      style: kTitleStyle.copyWith(
                        fontSize: 14,
                      ),
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
                      style: kTitleStyle.copyWith(
                        fontSize: 14,
                      ),
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
                  SizedBox(
                    //set the width of a widget to fill the available space.
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
                          //catch exception of user haven't done registered
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
                        style: kTitleStyle.copyWith(
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

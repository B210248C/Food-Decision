import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_interface/firstLogin.dart';
import 'package:login_interface/food_decision.dart';
import 'package:login_interface/register.dart';
import 'constant.dart';

class Login extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  //Create an AnimationController object
  AnimationController? controller;
  //Create an Animation object
  Animation? animation;

  //Override the initState() method
  @override
  void initState() {
    super.initState();

    //Create an AnimationController, setting its duration and vsync
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    //Initialize the Animation object to a new CurvedAnimation()
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    //Call the forward() method - this is going to propel or start the animation
    controller!.forward();

    //Call the addListener() method, the setState() - this is the one that is going to update the animation of the UI
    controller!.addListener(() {
      setState(() {});
    });
  }

  //Override the dispose() method
  @override
  void dispose() {
    super.dispose();
    //Dispose the AnimationController object - to release the resources use for the animation
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                image: AssetImage('images/foodbg.jpg'),
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 80.0,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Hero(
                          tag: 'street',
                          child: Container(
                            child: Center(
                              child: SizedBox(
                                height: 250,
                                width: 150,
                                child: Image.asset(
                                  'images/street.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            height: animation!.value * 150,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        child: Center(
                          child: InkWell(
                            splashColor: Colors.grey,
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, FirstLogin.id);
                                  },
                                  leading: Icon(Icons.login),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text('Login'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        child: Center(
                          child: InkWell(
                            splashColor: Colors.grey,
                            child: SizedBox(
                              width: 200,
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, register.id);
                                  },
                                  leading: Icon(Icons.person_add),
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text('Register'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.0,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

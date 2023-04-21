import 'package:flutter/material.dart';
import 'package:login_interface/screen/firstLogin.dart';
import 'package:login_interface/screen/login.dart';
import 'package:login_interface/screen/register.dart';
import 'package:login_interface/component/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_interface/screen/food_decision.dart';
import 'package:login_interface/screen/home.dart';
import 'package:login_interface/screen/input.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//This defines the route it should start with
      initialRoute: Login.id,
//This defines the available named routes and the widgets to build when navigating to those routes
      routes: {
        Login.id: (context) => Login(),
        FirstLogin.id: (context) => FirstLogin(),
        register.id: (context) => register(),
        QuestionPage.id: (context) => QuestionPage(),
        HomeScreen.id: (context) => HomeScreen(),
        FoodChoosePage.id: (context) => FoodChoosePage(),
      },
    );
  }
}

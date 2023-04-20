import 'package:flutter/material.dart';
import 'package:login_interface/home.dart';
import 'constant.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x8AFCE4F3),

      appBar: AppBar(
        backgroundColor: Color(0xFFEDA4B4),

        //icon button
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          tooltip: 'back',
          onPressed: () {
            setState(() {
              //When icon button is pressed, navigate to home screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            });
          },
        ),

        title: Center(
          child: Text(
            "ABOUT US",
            style: TextStyle(
              fontFamily: 'DynaPuff',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      // Column with container that shows the text details.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Program:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      'Bachelor of Software Engineering \n\n',
                      style: kFontFamily,
                    ),
                    Text(
                      'Subject Code:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      'Bachelor of Software Engineering \n\n',
                      style: kFontFamily,
                    ),
                    Text(
                      'Subject Name:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      'Mobile Application Development \n\n',
                      style: kFontFamily,
                    ),
                    Text(
                      'Lecturer Name:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      'Nur Samilla \n\n',
                      style: kFontFamily,
                    ),
                    Text(
                      'Academic Session:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      '2023A \n\n',
                      style: kFontFamily,
                    ),
                    Text(
                      'Group Member:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      '1. B210192C CHAN KA YING \n'
                      '2. B210230C YAP QIAN YI \n'
                      '3. B210248C KATHLEEN GOH YEE XUAN \n'
                      '4. B210249C JAMIELEEN GOH YEE CHEE \n'
                      '5. B220038B TAN CAI XUAN \n\n',
                      style: kFontFamily,
                    ),
                    Text(
                      'Project Goal:',
                      style: kAboutUsStyle,
                    ),
                    Text(
                      'The project goal is to create a user-friendly and engaging food app that helps users discover new food options that meet their dietary preferences and restrictions. \n\n',
                      style: kFontFamily,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

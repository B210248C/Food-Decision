import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_interface/screen/about_us.dart';
import 'package:login_interface/screen/login.dart';
import 'constant.dart';

class PopUpMenuButton extends StatelessWidget {
  const PopUpMenuButton({
    super.key,
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: new Icon(Icons.menu, color: Colors.white),
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          value: 1,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(
                Icons.chrome_reader_mode,
                color: kBlackColor,
              ),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text(
                "About Us",
                style: kTextStyle4,
              )
            ],
          ),
        ),

        // popupmenu item 2
        PopupMenuItem(
          value: 2,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: kBlackColor,
              ),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text(
                "Logout",
                style: kTextStyle4,
              )
            ],
          ),
        ),
      ],

      offset: Offset(0, 56),
      color: Colors.white,
      elevation: 2,

      // To track which popup menu item is selected and navigate to the correct page
      onSelected: (int menu) {
        if (menu == 1) {
          //when about us is pressed, navigate to about us page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AboutUsScreen()),
          );
        } else {
          if (_auth.currentUser == null) {
            // User is not logged in, show error message or take some other action
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("You are not logged in."),
                  actions: [
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            // User is logged in, proceed with logout action
            _auth.signOut();
            // when logout is pressed, navigate to login page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          }
        }
      },
    );
  }
}
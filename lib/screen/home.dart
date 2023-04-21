import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:login_interface/screen/food_decision.dart';
import 'package:login_interface/screen/input.dart';
import 'package:login_interface/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_interface/component/constant.dart';
import 'package:login_interface/component/pop_up_menu_button.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,

      appBar: AppBar(
        backgroundColor: kAppBarColor,

        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            if (_auth.currentUser == null) {
              // User is not logged in
              // when home icon is pressed, navigate to login page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            } else {
              // User is logged in, show error message or take some other action
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content:
                        Text("You have logged in, please proceed to log out."),
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
            }
          },
        ),

        title: Center(
          child: Text(
            "FOOD DECISION",
            style: kTitleStyle,
          ),
        ),

        // popup menu button
        actions: [
          PopUpMenuButton(auth: _auth),
        ],
      ),

      // Column for imageslideshow and card
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            //Package: To show the image by automatically slide to the next image.
            child: ImageSlideshow(
              // The first page to show on the screen.
              initialPage: 0,

              // The color to paint the indicator.
              indicatorColor: Colors.red,

              // The color to paint behind th indicator.
              indicatorBackgroundColor: Colors.white,

              // The widgets to display in the [ImageSlideshow].
              children: [
                Image.asset(
                  'images/bubble_tea.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/bibimbap.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/sushi.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'images/samgyetang.jpg',
                  fit: BoxFit.cover,
                ),
              ],

              // Called whenever the page in the center of the viewport changes.
              onPageChanged: (value) {
                print('Page changed: $value');
              },

              // Auto scroll interval.
              autoPlayInterval: 2000,

              // Loops back to first slide.
              isLoop: true,
            ),
          ),

          SizedBox(
            // sized box with height 20
            height: 20,
          ),

          Center(
              child: Text(
            '\" Do not know what to eat ? Try this ! \"',
            style: kTitleStyle,
          )),

          //Card
          Expanded(
            //Card 1
            child: Card(
              color: kBeigeColor,
              elevation: 10,
              // The shape of the border
              shape: RoundedRectangleBorder(
                // Customize the border size with color and width.
                side: BorderSide(
                  color: kAppBarColor,
                  width: 5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),

              // To change the behaviour when the card 1 is clicked.
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.black,
                onTap: () {
                  questionbrain.restart();
                  debugPrint('Card tapped.');
                  //when card 1 pressed, navigate to the question screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuestionPage()));
                },

                // Container with image and text
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('images/ramen.jpg'),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.5),
                              BlendMode.modulate,
                            ),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.only(top: 70.0),
                    child: Text(
                      "Food Decision Tree ",
                      style: kHomeTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Card
          Expanded(
            //Card 2
            child: Card(
              color: Color(0xFFFEEAC9),
              elevation: 10,
              // The shape of the border
              shape: RoundedRectangleBorder(
                // Customize the border size with color and width.
                side: BorderSide(
                  color: Color(0xFFE990A3),
                  width: 5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),

              // To change the behaviour when the card 2 is clicked.
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.black,
                onTap: () {
                  debugPrint('Card tapped.');
                  //when card 2 pressed, navigate to the random spin screen
                  Navigator.pushNamed(context, FoodChoosePage.id);
                },

                // Container with image and text
                child: Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('images/spinning_wheel.jpg'),
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.5),
                              BlendMode.modulate,
                            ),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.only(top: 70.0),
                    child: Text(
                      "Random Spin",
                      style: kHomeTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

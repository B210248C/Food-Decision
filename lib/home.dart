import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:login_interface/food_decision.dart';
import 'package:login_interface/input.dart';
import 'package:login_interface/login.dart';
import 'about_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constant.dart';
import 'login.dart';

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
            // When home button is pressed, navigate to login screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
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
          PopupMenuButton<int>(
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

            // To track which popup menu item is selected and navigate to the correct screen
            onSelected: (int menu) {
              if (menu == 1) {
                //when about us pressed, navigate to about us page
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
                  // when logout pressed, navigate to login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              }
            },
          ),
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
              elevation: 0,
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
              elevation: 0,
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

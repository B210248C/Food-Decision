import 'package:flutter/material.dart';
import 'package:login_interface/screen/firstLogin.dart';
import 'package:login_interface/screen/register.dart';
import 'package:login_interface/component/constant.dart';

class Login extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
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
      //using const ensures that the object is only created once at compile-time rather than being recreated every time the initState method is called at runtime.
      duration: const Duration(seconds: 2),
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
        //Used to stack widgets on top of each other. In this case, it is used to stack two container widgets, one containing an image and the other a black container with 60% opacity.
        body: Stack(children: [
          Container(
            //Used to decorate the container widget with an image as its background.
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/foodbg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            //Set the opacity of the black container to 60%.
            child: Opacity(
              opacity: 0.6, // 60% opacity
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Column(
            //child widgets will be evenly distributed along the main axis and there will be equal space between them.
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //child widgets will be stretched to fill the available horizontal space along the cross axis
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Wrap the container widget containing the logo image. It allows the widget to take up any remaining space after other widgets have been sized and positioned.
                    Flexible(
                      //Wrap the Container widget with a Hero widget, provide a tag.It allows for a smooth transition animation when navigating to another screen.
                      child: Hero(
                        tag: 'LOGOF',
                        child: SizedBox(
                          child: Center(
                            child: Image.asset(
                              'images/LOGOF.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          //Animate the size of the image using the Animation object value
                          height: animation!.value * 750,
                          width: animation!.value * 700,
                        ),
                      ),
                    ),
                    Center(
                      //The InkWell widget is used to create a material ripple effect when the user taps on the Login and Register buttons.
                      child: InkWell(
                        splashColor: Colors.grey,
                        child: SizedBox(
                          width: 200,
                          child: Card(
                            //The ListTile widget is used to create a custom Card widget containing an icon and a title.
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, FirstLogin.id);
                              },
                              leading: Icon(
                                Icons.login,
                                color: Colors.pink[600],
                              ),
                              title: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: kTitleStyle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        splashColor: Colors.grey,
                        child: SizedBox(
                          width: 200,
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, register.id);
                              },
                              leading: Icon(
                                Icons.person_add,
                                color: Colors.pink[
                                    600], // Set the color of the icon here
                              ),
                              title: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Register',
                                  style: kTitleStyle,
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
                height: 170.0,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

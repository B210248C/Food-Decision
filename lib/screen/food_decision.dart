import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_interface/component/constant.dart';
import 'package:login_interface/screen/home.dart';

import 'questionBrain.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

questionBrain questionbrain = questionBrain();

class QuestionPage extends StatefulWidget {
  static String id = 'food_decision_screen';
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: _buildBody(),
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
            child: Text(
          'Food Decision',
          style: kTitleStyle,
        )),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 12,
            child: Center(
              child: Text(
//use the questionBrain to get the first question title and display it in this Text Widget.
                questionbrain.getQuestion(),
                style: kTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {
// Choice 1 made by user
                setState(() {
//Call the nextQuestion() method from questionBrain and pass the number 1 as the choice made by the user.
                  questionbrain.nextQuestion(1);
                  if (questionbrain.getFoodNum() >= 0) _push();
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.brown),
                foregroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.white),
                shape: MaterialStateProperty.resolveWith(
                    (states) => BeveledRectangleBorder()),
              ),
              child: Text(
//Use the questionBrain to get the text for choice 1.
                questionbrain.getChoice1(),
                style: kTextStyle2,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
//Choice 2 made by user
//Call the nextQuestion() method from questionBrain and pass the number 2 as the choice made by the user.

                  setState(() {
                    questionbrain.nextQuestion(2);

                    if (questionbrain.getFoodNum() >= 0) _push();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.pink[400]),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => BeveledRectangleBorder()),
                ),
                child: Text(
//Use the questionBrain to get the text for choice 2.
                  questionbrain.getChoice2(),
                  style: kTextStyle2,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _push() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FoodDecisionPage(),
    ));
  }
}

class FoodDecisionPage extends StatefulWidget {
  @override
  _FoodDecisionPageState createState() => _FoodDecisionPageState();
}

class _FoodDecisionPageState extends State<FoodDecisionPage> {
  StreamController<int> selected = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          'Food Decision App',
          style: kHomeTextStyle,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0,
                  questionbrain.foodnumber(questionbrain.getFoodNum()).length),
            );
          });
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: FortuneWheel(
                  selected: selected.stream,
                  items: [
                    for (var food
                        in questionbrain.foodnumber(questionbrain.getFoodNum()))
                      FortuneItem(
                          child: Text(
                            food,
                            style: kTextStyle3,
                          ),
                          style: FortuneItemStyle(
                            color: kBeigeColor,
                            borderColor: kPurpleColor,
                            borderWidth: 10,
                          )),
                  ],
                ),
              ),
            ),
            Padding(
              //
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected.add(
                      Fortune.randomInt(
                          0,
                          questionbrain
                              .foodnumber(questionbrain.getFoodNum())
                              .length),
                    );
                  });
                },
                child: Text(
                  'Spin the wheel!',
                  style: kTextStyle,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => kBeigeColor),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => BeveledRectangleBorder()),
                ),
              ),
            ),
            Padding(
              //
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text(
                  'Go back',
                  style: kTextStyle,
                ),
                onPressed: () {
                  questionbrain.restart();
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => kBeigeColor),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => BeveledRectangleBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

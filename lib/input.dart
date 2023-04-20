import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_interface/constant.dart';


class FoodChoosePage extends StatefulWidget {
  static String id = 'food_decision_screen';
  @override
  _FoodChoosePageState createState() => _FoodChoosePageState();
}

class _FoodChoosePageState extends State<FoodChoosePage> {
  final _auth = FirebaseAuth.instance;
  StreamController<int> selected = StreamController<int>();
  TextEditingController _foodController = TextEditingController();
  List<String> foods = [
    '',
    '',
  ];

  @override
  void dispose() {
    selected.close();
    _foodController.dispose();
    super.dispose();
  }
// to add food
  void _addFood() {
    String newFood = _foodController.text;
    if (newFood.isNotEmpty) {
      setState(() {
        foods.add(newFood);
        print("PIPI");
        if (foods.length < 4 && foods.contains('')) {
          foods.removeWhere((str) {
            return str == '';
          });
        }
        if (foods.length < 2) {
          foods.add(foods[0]);
        } else {
          print(789);
          foods = foods.toSet().toList();
        }
// to check whether we have actually get the input
        print(foods);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text('Food Decision App'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, foods.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var food in foods)
                    FortuneItem(
                        child: Text(
                          food,
                          style: kTextStyle3,
                        ),
                        style: FortuneItemStyle(
                          color: kBeigeColor,
                          borderColor: kPurpleColor.withOpacity(0.7),
                          borderWidth: 15,
                        )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kAppBarColor,
                ),
                onPressed: () {
                  setState(() {
                    selected.add(
                      Fortune.randomInt(0, foods.length),
                    );
                    print(int.parse(selected.toString()));
                  });
                },
                child: Text(
                  'Spin the wheel!',
                  style: kTextStyle2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kAppBarColor,
                ),
                onPressed: () {
                  setState(() {
                    selected.add(
                      Fortune.randomInt(0, foods.length),
                    );
                  });
                },
                child: Text(
                  'What do you want to eat today?',
                  style: kTextStyle2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _foodController,
                decoration: InputDecoration(
                  labelText: 'Add your own food',
                  suffixIcon: IconButton(
                    onPressed: _addFood,
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

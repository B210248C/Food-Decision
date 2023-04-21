//import the question.dart file into this file.
import 'package:login_interface/screen/question.dart';

class questionBrain {
//This will be used to track which choice the user is currently viewing.
  int _questionNumber = 0;

// track the food type chosen
  int _foodnum = -1;

// to store type of food that can be used in wheel
  List<String> fruit = [
    'a piece of fruit',
    'a granola bar',
    'a yogurt',
  ];
  List<String> omelette = [
    'omelette',
    'scramble',
    ' burrito with eggs, vegetables, and cheese',
  ];
  List<String> toast = [
    'avocado toast',
    'breakfast sandwich',
    'oatmeal with nuts and seeds',
  ];
  List<String> pan = [
    'pancakes',
    'waffles',
    'pastries',
  ];
  List<String> bowls = [
    'smoothie bowls',
    'fruit salad',
    'Greek yogurt with berries and honey',
  ];
  List<String> light = [
    'salad',
    'sandwich',
    'soup',
  ];
  List<String> heavy = [
    'burger',
    'pizza',
    'fried foods',
  ];
  List<String> chinese = [
    'Hainan Chicken Rice',
    'Fried Rice',
    'Wonton Soup',
    'Wonton Mee',
    'Dumplings',
    'Chow Mein'
  ];
  List<String> malay = [
    'mee goreng',
    'mee rebus',
    'nasi ayam rendang',
    'Asam pedas',
    'Ikan bakar',
    'Acar'
  ];
  List<String> indian = [
    'Nasi ayam penyet',
    'roti canai',
    'roti telur',
    'roti bom',
    'Chapato',
    'Palak Paneer'
  ];
  List<String> korean = [
    'Kimchi Ramen',
    'Korean BBQ',
    'bulgogi',
    'bibimbap',
    'tteobokki'
  ];
  List<String> japan = [
    'sushi',
    'Tempura',
    'Udon',
    'Okonomiyaki',
    'Yakitori',
    'Miso soup',
    'takoyaki'
  ];
  List<String> thailand = [
    'Tom Yum Goong(Spicy Spawn Soup)',
    'Pad Thai(Thai Fried Noodle)',
    ' Gaeng Keow Wan Gai(Green Chicken Curry',
    'Kao Pad(Thai Fried Rice'
  ];
  List<String> western = [
    'Fish and chips',
    'breakfast sandwich',
    'Caeser Salad',
    'pizza'
  ];
  List<String> babanyonya = [
    'Ayam bua keluak',
    'Nyonya Kuih',
    'Bak Chang',
    'bubur cha cha',
    'Jiu hu char'
  ];
// to link the food number with the food chosen
  List<String> foodnumber(int num) {
    if (num == 0)
      return fruit;
    else if (num == 1)
      return omelette;
    else if (num == 2)
      return toast;
    else if (num == 3)
      return pan;
    else if (num == 4)
      return bowls;
    else if (num == 5)
      return light;
    else if (num == 6)
      return heavy;
    else if (num == 7)
      return chinese;
    else if (num == 8)
      return malay;
    else if (num == 9)
      return indian;
    else if (num == 10)
      return korean;
    else if (num == 11)
      return japan;
    else if (num == 12)
      return thailand;
    else if (num == 13)
      return babanyonya;
    else
      return western;
  }

// to store question data
  List<Question> _questionData = [
// array[0]
    Question(
      questionTitle: 'Do you want cooking at home or eating out',
      choice1: 'I\'m prefer to cook at home',
      choice2: 'I\'m prefer to eat out',
    ),
// array[1]
    Question(
        questionTitle: 'Do you want eating fast food or dishes',
        choice1: 'Fast food is best for me. It\'s delicious',
        choice2: 'I like to eat hot dishes,'),
// array[2]
    Question(
      questionTitle: 'Do you want something light or heavy?',
      choice1: 'light',
      choice2: 'heavy',
    ),
// array[3]
    Question(
      questionTitle: 'Do you want something local or foreign?',
      choice1: 'I want to eat local food',
      choice2: 'Woohoo! Foreign food is fresh for me',
    ),
// array[4]
    Question(
      questionTitle: 'Do you want Chinese cuisine?',
      choice1: 'Yes',
      choice2: 'No',
    ),
// array[5]
    Question(
      questionTitle: 'Do you want Malay cuisine?',
      choice1: 'Yes',
      choice2: 'No',
    ),
// array[6]
    Question(
      questionTitle: 'Do you want Indian cuisine or Nyonya Cuisine?',
      choice1: 'Indian Cuisine',
      choice2: 'wow! Nyonya kuih is delicious',
    ),
// array[7]
    Question(
        questionTitle: 'Do you prefer Japanese Cuisine or Korean Cuisine',
        choice1: 'Yes ',
        choice2: 'No'),
// array[8]
    Question(
        questionTitle: 'Do you prefer Japanese Cuisine or Korean Cuisine',
        choice1: 'Konnichiwa~ Of course! Japanese food ',
        choice2: 'Anneonghaseyo! Let\'s go for Korean food'),
// array[9]
    Question(
        questionTitle: 'Do you prefer Thailand Cuisine or Western cuisine?',
        choice1: 'I like to try Thailand food',
        choice2: 'I like to eat western food '),

// array[10]
    Question(
      questionTitle: 'Do you cook well?',
      choice1: 'Yes',
      choice2: 'No',
    ),
// array[11]
    Question(
      questionTitle: 'Do you cook western or eastern?',
      choice1: 'Western food',
      choice2: 'Eastern food',
    ),
// array[12]
    Question(
        questionTitle: 'Do you prefer a quick and easy option?',
        choice1: 'Yes',
        choice2: 'No'),
// array[13]
    Question(
        questionTitle: 'Do you want something savory or sweet?',
        choice1: 'Savory',
        choice2: 'Sweet'),
// array[14]
    Question(
        questionTitle:
            'Are you in the mood for eggs or other protein-rich options?',
        choice1:
            'Yes: Make an omelette, scramble, or breakfast burrito with eggs, vegetables, and cheese.',
        choice2:
            'No: Consider options like avocado toast, breakfast sandwich, or a bowl of oatmeal with nuts and seeds.'),
// array[15]
    Question(
        questionTitle:
            'Do you prefer baked goods or fruits for a sweet breakfast?',
        choice1:
            'Baked goods: Choose options like pancakes, waffles, or pastries.',
        choice2:
            'Fruits: Opt for options like smoothie bowls, fruit salad, or Greek yogurt with berries and honey.')
  ];
// to get the question and return question number
  String getQuestion() {
    return _questionData[_questionNumber].questionTitle;
  }

  // to get food num
  int getFoodNum() {
    return _foodnum;
  }

//Create a method called getChoice1() that returns the text for the first choice1 from _questionData.
  String getChoice1() {
    return _questionData[_questionNumber].choice1;
  }

//Create a method called getChoice2() that returns the text for the first choice2 from _questionData.
  String getChoice2() {
    return _questionData[_questionNumber].choice2;
  }

// when user click restart then will reset the question number to 0
  void restart() {
    _questionNumber = 0;
  }

  // to know the next question
  void nextQuestion(int choiceNumber) {
// array[0]
    if (_questionNumber == 0) {
      if (choiceNumber == 1) {
        _questionNumber = 10;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 1;
        _foodnum = -1;
      }
// array[1]
    } else if (_questionNumber == 1) {
      if (choiceNumber == 1) {
        _questionNumber = 2;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 3;
        _foodnum = -1;
      }
// array[2]
    } else if (_questionNumber == 2) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 6;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 7;
      }
// array[3]
    } else if (_questionNumber == 3) {
      if (choiceNumber == 1) {
        _questionNumber = 4;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 7;
        _foodnum = -1;
      }
// array[4]
    } else if (_questionNumber == 4) {
      if (choiceNumber == 1) {
        _questionNumber = 3;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 5;
        _foodnum = -1;
      }
// array[5]
    } else if (_questionNumber == 5) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 9;
      } else if (choiceNumber == 2) {
        _questionNumber = 6;
        _foodnum = -1;
      }
// array[6]
    } else if (_questionNumber == 6) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 10;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 13;
      }
// array[7]
    } else if (_questionNumber == 7) {
      if (choiceNumber == 1) {
        _questionNumber = 8;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 9;
        _foodnum = -1;
      }
// array[8]
    } else if (_questionNumber == 8) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 12;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 11;
      }
// array[9]
    } else if (_questionNumber == 9) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 13;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 14;
      }
// array[10]
    } else if (_questionNumber == 10) {
      if (choiceNumber == 1) {
        _questionNumber = 11;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 12;
        _foodnum = -1;
      }
// array[11]
    } else if (_questionNumber == 11) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 14;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 8;
      }
// array[12]
    } else if (_questionNumber == 12) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 0;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 4;
      }
// array[13]
    } else if (_questionNumber == 13) {
      if (choiceNumber == 1) {
        _questionNumber = 14;
        _foodnum = -1;
      } else if (choiceNumber == 2) {
        _questionNumber = 15;
        _foodnum = -1;
      }
    } else if (_questionNumber == 14) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 1;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 2;
      }
    } else if (_questionNumber == 15) {
      if (choiceNumber == 1) {
        _questionNumber = 0;
        _foodnum = 3;
      } else if (choiceNumber == 2) {
        _questionNumber = 0;
        _foodnum = 4;
      }
    }
  }
}

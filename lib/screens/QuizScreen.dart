import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:mobile_app/screens/GameModeScreen.dart';
import 'package:mobile_app/screens/ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  String calculation;

  QuizScreen(this.calculation);

  _QuizScreen createState() => _QuizScreen(calculation);
}

class _QuizScreen extends State<QuizScreen> {
  String calculation;
  int numberOfQuestion = 0;
  int stateIndex = 0;
  int number1;
  int number2;
  int trueAnswer = 0;
  int rightAnswerNumberIndexLeft;
  int choice1Index, choice2Index, choice3Index, choice4Index;
  List<String> answerList = <String>[];
  var random = new Random();

  String choice1 = "assets/images/blue_select_box.png";
  String choice2 = "assets/images/blue_select_box.png";
  String choice3 = "assets/images/blue_select_box.png";
  String choice4 = "assets/images/blue_select_box.png";

  void _navigateBack(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => GameModeScreen(widget.calculation)));
  }

  // Back function
  void _navigateToResultScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            new ResultScreen(widget.calculation, trueAnswer)));
  }

  _QuizScreen(String cal) {
    this.calculation = cal;
    number1 = random.nextInt(20) + 1;
    number2 = random.nextInt(20) + 1;
    // getRandomCalculation(number1, number2);
  }

  //constructor

  checkAnswer(int numberIndexLeft, BuildContext context) {
    setState(() {
      if (numberIndexLeft == rightAnswerNumberIndexLeft) {
        trueAnswer++;
      } else {
        trueAnswer--;
      }
      choice1 = "assets/images/red_select_box.png";
      choice2 = "assets/images/red_select_box.png";
      choice3 = "assets/images/red_select_box.png";
      choice4 = "assets/images/red_select_box.png";

      if (rightAnswerNumberIndexLeft == 4) {
        choice4 = "assets/images/green_select_box.png";
      } else if (rightAnswerNumberIndexLeft == 3) {
        choice3 = "assets/images/green_select_box.png";
      } else if (rightAnswerNumberIndexLeft == 2) {
        choice2 = "assets/images/green_select_box.png";
      } else if (rightAnswerNumberIndexLeft == 1) {
        choice1 = "assets/images/green_select_box.png";
      }
      stateIndex++;
      numberOfQuestion++;
      if (numberOfQuestion == 20)
        Timer _timer = Timer(Duration(seconds: 2), () {
          _navigateToResultScreen(context);
        });
    });
  }

  // each choice has different number of Index left in index list when they call getIndex function
  // this fuction checks if choice's numberIndexLeft equals to the numberIndexLeft of the right answer (similar to ID check)

  @override
  Widget build(BuildContext context) {
    String calculateIcon, result;
    int randomAnswer1, randomAnswer2, randomAnswer3;
    int duplicateTime;
    if (stateIndex % 2 == 0) {
      duplicateTime = random.nextInt(10) + 1;
      randomAnswer1 = (random.nextInt(500));
      randomAnswer2 = (random.nextInt(499));
      randomAnswer3 = (random.nextInt(499));
      while (randomAnswer2 == randomAnswer1)
        randomAnswer2 = (random.nextInt(499));
      while (randomAnswer2 == randomAnswer3 || randomAnswer3 == randomAnswer1)
        randomAnswer3 = (random.nextInt(499));
    }

    if (this.calculation == "plus")
      calculateIcon = " + ";
    else if (this.calculation == 'minus')
      calculateIcon = " - ";
    else if (this.calculation == 'duplicate')
      calculateIcon = " x ";
    else if (this.calculation == 'divide') calculateIcon = " : ";

    String question = "none";
    if (calculation == "plus") {
      result = (number1 + number2).toString();
      // right answer
    } else if (calculation == "minus") {
      result = (number1 - number2).toString();
      // right answer
    } else if (calculation == "duplicate") {
      result = (number1 * number2).toString();
      // right answer
    } else if (calculation == "divide") {
      if (stateIndex % 2 == 0) number1 = duplicateTime * number2;
      result = (number1 ~/ number2).toString();
      // right answer
      // ~/ is division return integer, / return double
    }
    question = number1.toString() + calculateIcon + number2.toString() + " =";
    //create question

    if (stateIndex % 2 == 0) {
      answerList.clear();
      answerList.add(result);
      answerList.add(randomAnswer1.toString());
      answerList.add(randomAnswer2.toString());
      answerList.add(randomAnswer3.toString());
      // insert 4 answers into list
    }

    List<int> indexList = List<int>();
    indexList.add(0);
    indexList.add(1);
    indexList.add(2);
    indexList.add(3);
    //insert 4 indexes of list

    int getIndex(int numberIndexLeft) {
      int x = random.nextInt(numberIndexLeft);
      int y = indexList.elementAt(x);
      if (y == 0) rightAnswerNumberIndexLeft = numberIndexLeft;
      // y = 0 is the index of result in answerList
      // the choice which got y = 0 is the right choice so its numberIndexleft is the numberIndexleft of the right answer
      indexList.remove(y);
      return y;
      // y is a random index value from 0 to 3, each time a value y is chosen, remove it from available indexList
    }

    if (stateIndex % 2 == 0) {
      choice4Index = getIndex(4);
      choice3Index = getIndex(3);
      choice2Index = getIndex(2);
      choice1Index = getIndex(1);
    }

    int nextQuestion() {
      Timer(Duration(seconds: 2), () {
        setState(() {
          number1 = random.nextInt(20) + 1;
          number2 = random.nextInt(20) + 1;
          choice1 = "assets/images/blue_select_box.png";
          choice2 = "assets/images/blue_select_box.png";
          choice3 = "assets/images/blue_select_box.png";
          choice4 = "assets/images/blue_select_box.png";
          stateIndex++;
        });
      });
      // the code will run after 2 seconds
    }

    return Scaffold(
      body: Container(
        child: GridView.count(
          childAspectRatio: (1.7 / 0.7),
          crossAxisCount: 1,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment(0.1, -1),
                  child: Container(
                    width: 140,
                    height: 140,
                    child: Align(
                      alignment: Alignment(-0.2, 0),
                      child: Text("  " + trueAnswer.toString(),
                          style: TextStyle(fontSize: 50, color: Colors.green)),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          "assets/images/true_button.png"),
                      fit: BoxFit.contain,
                    )),
                  ),
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/question_frame.png",
                      alignment: Alignment(0.9, 0),
                    ),
                    Align(
                      alignment: Alignment(0, -0.5),
                      child: Text(
                        question,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image.asset(
                    "assets/images/female_teacher_1.png",
                    scale: 0.8,
                  ),
                )
              ],
            ),
            Stack(
              alignment: Alignment(-0.2, -1.1),
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.2, -0.8),
                      child: InkWell(
                        child: Image.asset(
                          choice1,
                        ),
                        onTap: () {
                          checkAnswer(1, context);
                          nextQuestion();
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: InkWell(
                        child: Text(
                          answerList.elementAt(choice1Index),
                          style: TextStyle(fontSize: 32),
                        ),
                        onTap: () {
                          checkAnswer(1, context);
                          nextQuestion();
                        },
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.2, 0.2),
                      child: InkWell(
                        child: Image.asset(
                          choice2,
                        ),
                        onTap: () {
                          checkAnswer(2, context);
                          nextQuestion();
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.2),
                      child: InkWell(
                        child: Text(
                          answerList.elementAt(choice2Index),
                          style: TextStyle(fontSize: 32),
                        ),
                        onTap: () {
                          checkAnswer(2, context);
                          nextQuestion();
                        },
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Align(
                        alignment: Alignment(-0.2, 1.2),
                        child: InkWell(
                          child: Image.asset(
                            choice3,
                          ),
                          onTap: () {
                            checkAnswer(3, context);
                            nextQuestion();
                          },
                        )),
                    Align(
                      alignment: Alignment(0, 1.2),
                      child: InkWell(
                        child: Text(
                          answerList.elementAt(choice3Index),
                          style: TextStyle(fontSize: 32),
                        ),
                        onTap: () {
                          checkAnswer(3, context);
                          nextQuestion();
                        },
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Align(
                        alignment: Alignment(-0.2, 2.2),
                        child: InkWell(
                          child: Image.asset(
                            choice4,
                          ),
                          onTap: () {
                            checkAnswer(4, context);
                            nextQuestion();
                          },
                        )),
                    Align(
                      alignment: Alignment(0, 2.1),
                      child: InkWell(
                        child: Text(
                          answerList.elementAt(choice4Index),
                          style: TextStyle(fontSize: 32),
                        ),
                        onTap: () {
                          checkAnswer(4, context);
                          nextQuestion();
                        },
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background_2.png"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}

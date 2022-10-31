import 'dart:async';

import 'package:fastest_finger_calculator/Calculator/custom_text_animation.dart';
import 'package:fastest_finger_calculator/Calculator/ripple_animation.dart';
import 'package:fastest_finger_calculator/Calculator/widgets/custom_switch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MainCalculatorDesktop extends StatefulWidget {
  const MainCalculatorDesktop({Key? key}) : super(key: key);

  @override
  State<MainCalculatorDesktop> createState() => _MainCalculatorDesktopState();
}

class _MainCalculatorDesktopState extends State<MainCalculatorDesktop> {
  List<CustomAnimatedText> allTexts = [];

  late IconData sign;

  late Timer timer;

  late Timer timer2;

  int signCount = 0;

  // late double calculatedValue = 0;
  num calculatedValue = 0;

  bool isCalculated = false;

  int questionCount = 0;

  //check answer
  bool isCorrect = false;
  bool isWrong = false;
  bool questionStarted = false;

  Stopwatch stopwatch = Stopwatch();

  List<QuestionAnswered> questionAnswered = [];

  @override
  void dispose() {
    timer.cancel();
    timer2.cancel();
    stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(MediaQuery.of(context).size.width);
      print(MediaQuery.of(context).size.height);
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.grey[100],
              decoration: BoxDecoration(
                // this hide in mobile
                color: Theme.of(context).backgroundColor,
              ),
              padding: const EdgeInsets.only(top: 90, left: 10, right: 18),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: allTexts.toList(),
                  ),
                  isCalculated
                      ? Text(
                          calculatedValue.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  //bottomLeft: Radius.circular(35.0), // this hide in mobile
                  //bottomRight: Radius.circular(35.0), // this hide in mobile
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calculatorButton(
                          text: 'C',
                          color: const Color(0xFF9d7fff),
                          isSign: false,
                          isClearBtn: true,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          showShadow: false,
                          onPressed: () {
                            // showTopSnackBar(
                            //   context,
                            //   const CustomSnackBar.info(
                            //     message:
                            //         "There is some information. You need to do something with that",
                            //   ),
                            // );
                            setState(() {
                              allTexts.clear();
                              calculatedValue = 0;
                              isCalculated = false;
                              signCount = 0;
                            });
                          },
                        ),
                        calculatorButton(
                          icon: FeatherIcons.percent,
                          color: const Color(0xFF9d7fff),
                          isSign: true,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: true,
                          showShadow: false,
                          onPressed: () {
                            final allMath = allTexts.map((e) {
                              if (e.text == '') {
                                return ' ';
                              } else {
                                return e.text;
                              }
                            }).join();

                            if (allMath.split(' ').length == 1) {
                              final percent = double.parse(allMath) / 100;

                              setState(() {
                                allTexts.clear();
                                allTexts.add(CustomAnimatedText(
                                  text: percent.toString(),
                                ));
                              });

                              if (kDebugMode) {
                                print(allMath);
                                print(percent);
                              }
                            }
                          },
                        ),
                        calculatorButton(
                          icon: FeatherIcons.delete,
                          color: const Color(0xFF9d7fff),
                          isSign: true,
                          isClearBtn: false,
                          isDeleteBtn: true,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          showShadow: false,
                          onPressed: () {
                            final allInputs = getInputs();

                            if (kDebugMode) {
                              print(allInputs);
                              print(allInputs.length);
                            }

                            if (allInputs[1].isEmpty) {
                              setState(() {
                                signCount = 0;
                                allTexts.removeLast();
                              });
                            } else {
                              setState(() {
                                allTexts.removeLast();
                              });
                            }
                          },
                        ),
                        calculatorButton(
                          icon: LineIcons.divide,
                          color: const Color(0xFF9d7fff),
                          isSign: true,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calculatorButton(
                          text: '7',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '8',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '9',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          icon: FeatherIcons.x,
                          color: const Color(0xFF9d7fff),
                          isSign: true,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calculatorButton(
                          text: '4',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '5',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '6',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          icon: FeatherIcons.minus,
                          color: const Color(0xFF9d7fff),
                          isSign: true,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calculatorButton(
                          text: '1',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '2',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '3',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          icon: FeatherIcons.plus,
                          color: const Color(0xFF9d7fff),
                          isSign: true,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calculatorButton(
                          text: '0',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '.',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '00',
                          color: Colors.black,
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: false,
                          isPercentBtn: false,
                          onPressed: () {},
                          showShadow: false,
                        ),
                        calculatorButton(
                          text: '=',
                          color: const Color(0xFF9d7fff),
                          isSign: false,
                          isClearBtn: false,
                          isDeleteBtn: false,
                          isEqualsBtn: true,
                          isPercentBtn: false,
                          showShadow: true,
                          onPressed: () {
                            stopwatch.stop();
                            final allMath = allTexts.map((e) {
                              if (e.text == '') {
                                return ' ';
                              } else {
                                return e.text;
                              }
                            }).join();

                            final textToCalculate = allMath.split(' ');
                            if (kDebugMode) {
                              print(allMath);
                              print(textToCalculate);
                              print(textToCalculate[0]);
                              print(textToCalculate[1]);
                              print(num.parse(textToCalculate[0]));
                              print(num.parse(textToCalculate[1]));
                            }

                            if (textToCalculate[0].isNotEmpty &&
                                textToCalculate[1].isNotEmpty) {
                              // final calculation = calculate(
                              //     num1: double.parse(textToCalculate[0]),
                              //     num2: double.parse(textToCalculate[1]));
                              final calculation = calculate2(
                                  num1: num.parse(textToCalculate[0]),
                                  num2: num.parse(textToCalculate[1]));

                              setState(() {
                                calculatedValue = calculation;
                                isCalculated = true;
                                signCount = 0;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: SwitchBtn(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.002,
            right: MediaQuery.of(context).size.width * 0.38,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('clicked');
                    }
                    startGame();
                  },
                  child: const Icon(
                    FeatherIcons.playCircle,
                    color: Color(0xFF9d7fff),
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.002,
            right: MediaQuery.of(context).size.width * 0.33,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('clicked');
                    }
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(
                    FeatherIcons.bookOpen,
                    color: Color(0xFF9d7fff),
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget calculatorButton({
    String? text,
    IconData? icon,
    required Color color,
    required bool isSign,
    required bool isClearBtn,
    required bool isDeleteBtn,
    required bool isPercentBtn,
    required bool isEqualsBtn,
    required VoidCallback onPressed,
    required bool showShadow,
  }) {
    final isSpecialBtn =
        isClearBtn || isDeleteBtn || isPercentBtn || isEqualsBtn;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: RippleAnimation(
        color: color,
        isAutoStart: false,
        onTap: isSpecialBtn
            ? onPressed
            : () {
                if (isSign) {
                  // final isSignAdded = checkIsSign();
                  // if (kDebugMode) {
                  //   print(signCount);
                  // }
                  if (signCount < 1) {
                    setState(() {
                      signCount++;
                      allTexts.add(CustomAnimatedText(
                        text: '',
                        icon: icon,
                      ));
                      sign = icon!;
                    });
                  } else {
                    summarizeTotal();
                    setState(() {
                      signCount++;
                      allTexts.add(CustomAnimatedText(
                        text: '',
                        icon: icon,
                      ));
                      sign = icon!;
                    });
                  }
                } else {
                  setState(() {
                    allTexts.add(CustomAnimatedText(text: text ?? ''));
                  });
                }
              },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: const Color(0xFF9d7fff).withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 6), // changes position of shadow
                    ),
                  ]
                : [],
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: isEqualsBtn
                ? const Color(0xFF9d7fff)
                : Theme.of(context).cardColor,
            child: isSign
                ? Icon(
                    icon ?? Icons.add,
                    size: 40,
                    color: isEqualsBtn ? Colors.white : color,
                  )
                : Text(
                    text ?? '',
                    style: TextStyle(
                      fontSize: 40,
                      color: isEqualsBtn
                          ? Colors.white
                          : isClearBtn
                              ? const Color(0xFF9d7fff)
                              : Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  List<String> getInputs() {
    final allMath = allTexts.map((e) {
      if (e.text == '') {
        return ' ';
      } else {
        return e.text;
      }
    }).join();

    final textToCalculate = allMath.split(' ');

    return textToCalculate;
  }

  summarizeTotal() {
    final allMath = allTexts.map((e) {
      if (e.text == '') {
        return ' ';
      } else {
        return e.text;
      }
    }).join();

    final textToCalculate = allMath.split(' ');
    if (kDebugMode) {
      print(allMath);
      print(textToCalculate);
      print(textToCalculate[0]);
      print(textToCalculate[1]);
    }
    final calculation = calculate(
        num1: double.parse(textToCalculate[0]),
        num2: double.parse(textToCalculate[1]));

    setState(() {
      allTexts.clear();
      allTexts.add(CustomAnimatedText(text: calculation.toString()));
      //calculatedValue = calculation;
      // isCalculated = true;
      signCount = 0;
    });
  }

  double calculate({required double num1, required double num2}) {
    if (sign == FeatherIcons.x) {
      return num1 * num2;
    } else if (sign == FeatherIcons.minus) {
      return num1 - num2;
    } else if (sign == FeatherIcons.plus) {
      return num1 + num2;
    } else if (sign == LineIcons.divide) {
      return num1 / num2;
    } else {
      return 0;
    }
  }

  num calculate2({required num num1, required num num2}) {
    if (sign == FeatherIcons.x) {
      return num1 * num2;
    } else if (sign == FeatherIcons.minus) {
      return num1 - num2;
    } else if (sign == FeatherIcons.plus) {
      return num1 + num2;
    } else if (sign == LineIcons.divide) {
      return num1 / num2;
    } else {
      return 0;
    }
  }

  final List<Question> questions = [
    Question(
        question:
            '"Calculate Area Of A Square. Given side 8cm. Formular A = a^2"',
        answer: '64cm^2',
        answerValue: 64),
    Question(
        question:
            '"Calculate Area Of A Rectangle. Given length 8cm and width 4cm. Formular A = l * w"',
        answer: '32cm^2',
        answerValue: 32),
    Question(
        question:
            '"Calculate Area Of A Triangle. Given base 8cm and height 4cm. Formular A = 1/2 * b * h"',
        answer: '16cm^2',
        answerValue: 16),
    Question(
        question:
            '"Calculate Area Of A Circle. Given radius 8cm. Formular A = pi * r^2"',
        answer: '200.96cm^2',
        answerValue: 200.96),
    Question(
        question:
            '"Calculate Area Of A Trapezoid. Given base 8cm and height 4cm. Formular A = 1/2 * (b1 + b2) * h"',
        answer: '32cm^2',
        answerValue: 32),
    Question(
        question:
            '"Calculate Area Of A Parallelogram. Given base 8cm and height 4cm. Formular A = b * h"',
        answer: '32cm^2',
        answerValue: 32),
    Question(
        question:
            '"Calculate Area Of A Rhombus. Given base 8cm and height 4cm. Formular A = 1/2 * d1 * d2"',
        answer: '16cm^2',
        answerValue: 16),
    Question(
        question:
            '"Calculate Area Of A Sector. Given radius 8cm and angle 90°. Formular A = 1/2 * r^2 * theta"',
        answer: '100.53cm^2',
        answerValue: 100.53),
    Question(
        question:
            '"Calculate Area Of A Regular Polygon. Given side 8cm and number of sides 6. Formular A = 1/2 * n * s^2 * tan(180°/n)"',
        answer: '173.21cm^2',
        answerValue: 173.21),
    Question(
        question:
            '"Calculate Area Of A Regular Polygon. Given side 8cm and number of sides 6. Formular A = 1/2 * n * s^2 * tan(180°/n)"',
        answer: '173.21cm^2',
        answerValue: 173.21),
  ];

  late AnimationController localAnimationController;

  startGame() {
    showTopSnackBar(
      context,
      const CustomSnackBar.info(
        message:
            "Welcome to the calculator game. You have to calculate the numbers and get the correct answer. If you get the correct answer, you will get 1 point. If you get the wrong answer, you will lose 1 point. If you get 0 points, you will lose the game. Good luck!",
        backgroundColor: Color(0xFF9d7fff),
      ),
      persistent: true,
      onAnimationControllerInit: (controller) =>
          localAnimationController = controller,
      onTap: () {
        localAnimationController.reverse();
        timer2.cancel();
        //timer.cancel();
        stopwatch.reset();
        stopwatch.stop();
        setState(() {
          questionStarted = false;
          questionCount = 0;
          isCorrect = false;
          isWrong = false;
        });
      },
    );

    //timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    // if (timer.tick == 60) {
    //   timer.cancel();
    //   if (score == 0) {
    //     showTopSnackBar(
    //       context,
    //       const CustomSnackBar.error(
    //         message: "You lost the game. Try again!",
    //         backgroundColor: Color(0xFF9d7fff),
    //       ),
    //     );
    //   } else {
    //     showTopSnackBar(
    //       context,
    //       const CustomSnackBar.success(
    //         message: "You won the game. Congratulations!",
    //         backgroundColor: Color(0xFF9d7fff),
    //       ),
    //     );
    //   }
    // }
    //});

    timer2 = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (questionCount == questions.length) {
        localAnimationController.reverse();
        timer2.cancel();
      } else {
        // setState(() {
        //   questionStarted = true;
        // });

        if (kDebugMode) {
          print(questionStarted);
          print(questionCount);
          print(questions[questionCount].answerValue);
          print(calculatedValue);
        }

        if (questionCount > 0 &&
            questionStarted &&
            questions[questionCount - 1].answerValue == calculatedValue) {
          setState(() {
            isCorrect = true;
          });
          localAnimationController.reverse();
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message:
                  "Time is up. And you got the question right. Right Anwser is ${questions[questionCount - 1].answer} and your's is $calculatedValue. And it took you ${stopwatch.elapsed.inSeconds} seconds. Try next question.",
              backgroundColor: Colors.green,
            ),
            persistent: true,
            onAnimationControllerInit: (controller) =>
                localAnimationController = controller,
          );
          questionAnswered.add(
            QuestionAnswered(
              question: questions[questionCount - 1].question,
              answer: questions[questionCount - 1].answer,
              answerValue: questions[questionCount - 1].answerValue,
              yourAnswerValue: calculatedValue,
              wonBy: 'You',
              won: true,
              timeTaken: stopwatch.elapsed.inSeconds,
              score: 5,
              questionNumber: questionCount - 1,
              totalQuestions: questions.length,
              timeTakenByOpponent: 0,
            ),
          );
        } else if (questionCount > 0 &&
            questionStarted &&
            questions[questionCount - 1].answerValue != calculatedValue) {
          setState(() {
            isWrong = true;
          });
          localAnimationController.reverse();
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message:
                  "Time is up. And you got the question wrong. Right Anwser is ${questions[questionCount - 1].answer} and your's is $calculatedValue. And it took you ${stopwatch.elapsed.inSeconds} seconds. Try next question.",
              backgroundColor: Colors.red,
            ),
            persistent: true,
            onAnimationControllerInit: (controller) =>
                localAnimationController = controller,
          );
          questionAnswered.add(
            QuestionAnswered(
              question: questions[questionCount - 1].question,
              answer: questions[questionCount - 1].answer,
              answerValue: questions[questionCount - 1].answerValue,
              yourAnswerValue: calculatedValue,
              wonBy: 'Opponent',
              won: false,
              timeTaken: stopwatch.elapsed.inSeconds,
              score: 0,
              questionNumber: questionCount - 1,
              totalQuestions: questions.length,
              timeTakenByOpponent: 1,
            ),
          );
        }

        if (kDebugMode) {
          print('isCorrect 1: $isCorrect');
          print('isWrong 2: $isWrong');
        }

        Future.delayed(const Duration(seconds: 2), () {
          localAnimationController.reverse();
          setState(() {
            isCorrect = false;
            isWrong = false;
          });

          if (kDebugMode) {
            print('isCorrect: $isCorrect');
            print('isWrong: $isWrong');
          }

          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message: questions[questionCount].question,
              backgroundColor: const Color(0xFF9d7fff),
            ),
            persistent: true,
            onAnimationControllerInit: (controller) =>
                localAnimationController = controller,
            onTap: () {
              localAnimationController.reverse();
              timer2.cancel();
              //timer.cancel();
              stopwatch.reset();
              stopwatch.stop();
              setState(() {
                questionStarted = false;
                questionCount = 0;
                isCorrect = false;
                isWrong = false;
              });
            },
          );

          stopwatch.reset();
          stopwatch.start();

          setState(() {
            isCorrect = false;
            isWrong = false;
            questionCount++;
            questionStarted = true;
          });
        });

        // Future.delayed(const Duration(seconds: 1));
        // localAnimationController.reverse();
        // // isCorrect = false;
        // // isWrong = false;

        // if (kDebugMode) {
        //   print('isCorrect: $isCorrect');
        //   print('isWrong: $isWrong');
        // }

        // showTopSnackBar(
        //   context,
        //   CustomSnackBar.info(
        //     message: questions[questionCount].question,
        //     backgroundColor: isCorrect
        //         ? Colors.green
        //         : isWrong
        //             ? Colors.red
        //             : const Color(0xFF9d7fff),
        //   ),
        //   persistent: true,
        //   onAnimationControllerInit: (controller) =>
        //       localAnimationController = controller,
        // );

        // setState(() {
        //   isCorrect = false;
        //   isWrong = false;
        //   questionCount++;
        //   questionStarted = true;
        // });
      }
    });

    // showTopSnackBar(
    //   context,
    //   const CustomSnackBar.info(
    //     message: "Calculate Area Of A Square. Given side 8cm. Formular A = a^2",
    //     backgroundColor: Color(0xFF9d7fff),
    //   ),
    // );
  }
}

class Question {
  final String question;
  final String answer;
  final num answerValue;

  Question({
    required this.question,
    required this.answer,
    required this.answerValue,
  });
}

class QuestionAnswered {
  final String question;
  final String answer;
  final num answerValue;
  final num yourAnswerValue;
  final String wonBy;
  final bool won;
  final int timeTaken;
  final int score;
  final int questionNumber;
  final int totalQuestions;
  final int timeTakenByOpponent;

  QuestionAnswered({
    required this.question,
    required this.answer,
    required this.answerValue,
    required this.yourAnswerValue,
    required this.wonBy,
    required this.won,
    required this.timeTaken,
    required this.score,
    required this.questionNumber,
    required this.totalQuestions,
    required this.timeTakenByOpponent,
  });
}

import 'dart:async';

import 'package:fastest_finger_calculator/Calculator/custom_text_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/models.dart';

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

class CalculatorState extends ChangeNotifier {
  late AnimationController localAnimationController;

  final List<CustomAnimatedText> _allTexts = [];

  late IconData _sign;

  num _calculatedValue = 0;

  bool _isCalculated = false;

  int signCount = 0;

  late Timer timer2;

  int questionCount = 0;

  //check answer
  bool isCorrect = false;
  bool isWrong = false;
  bool questionStarted = false;

  Stopwatch stopwatch = Stopwatch();

  List<QuestionAnswered> questionAnswered = [];

  List<CustomAnimatedText> get allTexts => _allTexts;

  IconData get sign => _sign;

  num get calculatedValue => _calculatedValue;

  bool get isCalculated => _isCalculated;

  set setSign(IconData sign) => _sign = sign;

  @override
  void dispose() {
    timer2.cancel();
    stopwatch.stop();
    localAnimationController.dispose();
    super.dispose();
  }

  void addAllTexts(
      {required String text, IconData? icon, required bool isSign}) {
    if (text != '') {
      if (kDebugMode) {
        print('text 1: $text');
        print('icon 2: $icon');
      }
      allTexts.add(CustomAnimatedText(text: text, icon: icon));
      notifyListeners();
    } else if (icon != null && allTexts.isNotEmpty && isSign) {
      if (signCount < 1) {
        signCount++;
        if (kDebugMode) {
          print('text 3: $text');
          print('icon 4: $icon');
          print('signCount: $signCount');
        }
        allTexts.add(CustomAnimatedText(text: text, icon: icon));
        notifyListeners();
      } else {
        summarizeTotal(icon: icon);
        if (kDebugMode) {
          print('text 5: $text');
          print('icon 6: $icon');
          print('signCount: $signCount');
        }
        signCount++;
        // allTexts.add(CustomAnimatedText(text: text, icon: icon));
        notifyListeners();
      }
    }
    notifyListeners();
  }

  void clearAllTexts() {
    allTexts.clear();
    _calculatedValue = 0;
    _isCalculated = false;
    signCount = 0;
    notifyListeners();
  }

  void removeLastallTexts() {
    final allInputs = getInputs();
    if (allInputs[1].isEmpty) {
      signCount = 0;
      allTexts.removeLast();
    } else {
      allTexts.removeLast();
    }
    notifyListeners();
  }

  void calculatorTotal() {
    final allMath = allTexts.map((e) {
      if (e.text == '') {
        return ' ';
      } else {
        return e.text;
      }
    }).join();

    final textToCalculate = allMath.split(' ');
    final calculation = _calculate(
        num1: num.parse(textToCalculate[0]),
        num2: num.parse(textToCalculate[1]));

    if (kDebugMode) {
      print(calculation);
    }

    _calculatedValue = calculation;
    _isCalculated = true;
    notifyListeners();
  }

  void calculatePercentage() {
    final allMath = allTexts.map((e) {
      if (e.text == '') {
        return ' ';
      } else {
        return e.text;
      }
    }).join();

    if (allMath.split(' ').length == 1) {
      final percent = double.parse(allMath) / 100;

      clearAllTexts();
      addAllTexts(text: percent.toString(), icon: null, isSign: false);
      notifyListeners();
    }
  }

  num _calculate({required num num1, required num num2}) {
    if (sign == FeatherIcons.x) {
      return num1 * num2;
    } else if (sign == FeatherIcons.minus) {
      return num1 - num2;
    } else if (sign == FeatherIcons.plus) {
      return num1 + num2;
    } else if (sign == LineIcons.divide) {
      //return num1 / num2;
      bool isRemainder = num1.remainder(num2) > 0;
      dynamic result = num1.runtimeType == int && num2.runtimeType == int && isRemainder == false;
      if (kDebugMode) {
        print(result);
        print(num.parse((num1 / num2).toStringAsFixed(6)));
      }
      return result
          ? num1 ~/ num2
          : num.parse((num1 / num2).toStringAsFixed(6));
    } else {
      return 0;
    }
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

  summarizeTotal({required IconData icon}) {
    final textToCalculate = getInputs();
    if (kDebugMode) {
      print(textToCalculate);
    }
    if (textToCalculate[1] != '') {
      if (kDebugMode) {
        print(textToCalculate);
      }
      final calculation = _calculate(
          num1: num.parse(textToCalculate[0]),
          num2: num.parse(textToCalculate[1]));

      allTexts.clear();
      allTexts.add(CustomAnimatedText(text: calculation.toString()));
      allTexts.add(CustomAnimatedText(text: '', icon: icon));
      signCount = 0;
      notifyListeners();
    }
  }

  void startGame({required BuildContext context}) {
    showTopSnackBar(
      context,
      const CustomSnackBar.info(
        message:
            "Welcome to the calculator game. You have to calculate the numbers and get the correct answer. If you get the correct answer, you will get 1 point. If you get the wrong answer, you will lose 1 point. If you get 0 points, you will lose the game. Good luck!",
        backgroundColor: Color(0xFF9d7fff),
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),
        maxLines: 7,
      ),
      persistent: true,
      onAnimationControllerInit: (controller) =>
          localAnimationController = controller,
      onTap: () {
        localAnimationController.reverse();
        timer2.cancel();
        stopwatch.reset();
        stopwatch.stop();

        questionStarted = false;
        questionCount = 0;
        isCorrect = false;
        isWrong = false;
        notifyListeners();
      },
    );

    timer2 = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (questionCount == questions.length) {
        localAnimationController.reverse();
        timer2.cancel();
      } else {
        if (kDebugMode) {
          print(questionStarted);
          print(questionCount);
          print(questions[questionCount].answerValue);
          print(calculatedValue);
        }

        if (questionCount > 0 &&
            questionStarted &&
            questions[questionCount - 1].answerValue == calculatedValue) {
          isCorrect = true;
          notifyListeners();
          localAnimationController.reverse();
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message:
                  "Time is up. And you got the question right. Right Anwser is ${questions[questionCount - 1].answer} and your's is $calculatedValue. And it took you ${stopwatch.elapsed.inSeconds} seconds. Try next question.",
              backgroundColor: Colors.green,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
              maxLines: 4,
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
          isWrong = true;
          notifyListeners();
          localAnimationController.reverse();
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message:
                  "Time is up. And you got the question wrong. Right Anwser is ${questions[questionCount - 1].answer} and your's is $calculatedValue. And it took you ${stopwatch.elapsed.inSeconds} seconds. Try next question.",
              backgroundColor: Colors.red,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
              maxLines: 3,
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

        Future.delayed(const Duration(seconds: 2), () {
          localAnimationController.reverse();

          isCorrect = false;
          isWrong = false;
          notifyListeners();

          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message: questions[questionCount].question,
              backgroundColor: const Color(0xFF9d7fff),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white),
              maxLines: 3,
            ),
            persistent: true,
            onAnimationControllerInit: (controller) =>
                localAnimationController = controller,
            onTap: () {
              localAnimationController.reverse();
              timer2.cancel();
              stopwatch.reset();
              stopwatch.stop();

              questionStarted = false;
              questionCount = 0;
              isCorrect = false;
              isWrong = false;
              notifyListeners();
            },
          );

          stopwatch.reset();
          stopwatch.start();

          isCorrect = false;
          isWrong = false;
          questionCount++;
          questionStarted = true;
          notifyListeners();
        });
      }
    });
  }
}

import 'package:fastest_finger_calculator/Calculator/custom_text_animation.dart';
import 'package:fastest_finger_calculator/Calculator/ripple_animation.dart';
import 'package:fastest_finger_calculator/Calculator/widgets/custom_switch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:line_icons/line_icons.dart';

class MainCalculator extends StatefulWidget {
  const MainCalculator({Key? key}) : super(key: key);

  @override
  State<MainCalculator> createState() => _MainCalculatorState();
}

class _MainCalculatorState extends State<MainCalculator> {
  List<CustomAnimatedText> allTexts = [];

  late IconData sign;

  late double calculatedValue = 0;

  bool isCalculated = false;

  @override
  Widget build(BuildContext context) {
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
                // color: Colors.grey[100],
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(35)),
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
              child: Column(
                children: [
                  Row(
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
                          setState(() {
                            allTexts.clear();
                            calculatedValue = 0;
                            isCalculated = false;
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
                          setState(() {
                            allTexts.removeLast();
                          });
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
                          //allTexts[0].icon == LineIcons.equals;
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
                            calculatedValue = calculation;
                            isCalculated = true;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.3,
            child: const SwitchBtn(),
          )
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
                  setState(() {
                    allTexts.add(CustomAnimatedText(
                      text: '',
                      icon: icon,
                    ));
                    sign = icon!;
                  });
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
}

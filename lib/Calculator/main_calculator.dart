import 'package:fastest_finger_calculator/Calculator/ripple_animation.dart';
import 'package:fastest_finger_calculator/Calculator/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'application/calculator_state.dart';

class MainCalculator extends StatefulWidget {
  const MainCalculator({Key? key}) : super(key: key);

  @override
  State<MainCalculator> createState() => _MainCalculatorState();
}

class _MainCalculatorState extends State<MainCalculator> {
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
              padding: const EdgeInsets.only(top: 180, left: 10, right: 18),
              child: Consumer<CalculatorState>(
                  builder: (context, calculatorState, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: calculatorState.allTexts.toList(),
                    ),
                    calculatorState.isCalculated
                        ? Text(
                            calculatorState.calculatedValue.toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          )
                        : const SizedBox(),
                  ],
                );
              }),
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
                          context.read<CalculatorState>().clearAllTexts();
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
                          context.read<CalculatorState>().calculatePercentage();
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
                          context.read<CalculatorState>().removeLastallTexts();
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
                          context.read<CalculatorState>().calculatorTotal();
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
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.001,
            right: MediaQuery.of(context).size.width * 0.29,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: GestureDetector(
                onTap: () {
                  context.read<CalculatorState>().startGame(context: context);
                },
                child: const Icon(
                  FeatherIcons.playCircle,
                  color: Color(0xFF9d7fff),
                  size: 30.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.001,
            right: MediaQuery.of(context).size.width * 0.18,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
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
                  context
                      .read<CalculatorState>()
                      .addAllTexts(text: '', icon: icon, isSign: isSign);
                  context.read<CalculatorState>().setSign = icon!;
                } else {
                  context
                      .read<CalculatorState>()
                      .addAllTexts(text: text ?? '', isSign: false);
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
}

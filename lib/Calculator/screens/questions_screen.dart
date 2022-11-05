import 'package:fastest_finger_calculator/Calculator/application/calculator_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final questionFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(
                color: Colors.black,
              ),
              Form(
                key: questionFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Question Title',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      onChanged: (val) {
                        context.read<CalculatorState>().customQuestionTitle =
                            val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid question title';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Question Answer',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      onChanged: (val) {
                        context.read<CalculatorState>().customQuestionAnswer =
                            val;
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid answer';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Question Answer 2',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      onChanged: (val) {
                        context
                            .read<CalculatorState>()
                            .customQuestionAnswerValue = double.parse(val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid answer number';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print('tapped');
                        }
                        if (questionFormKey.currentState!.validate()) {
                          if (kDebugMode) {
                            print('validated');
                          }
                          context.read<CalculatorState>().addNewQuestions();
                          questionFormKey.currentState!.reset();
                        }
                      },
                      child: Center(
                        child: Container(
                          width: 170.0,
                          //height: 100.0,
                          constraints: const BoxConstraints(
                            maxWidth: 170.0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xFF9d7fff),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Add Question',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

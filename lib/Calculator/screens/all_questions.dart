import 'package:fastest_finger_calculator/Calculator/application/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllQuestions extends StatefulWidget {
  const AllQuestions({Key? key}) : super(key: key);

  @override
  State<AllQuestions> createState() => _AllQuestionsState();
}

class _AllQuestionsState extends State<AllQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<CalculatorState>(
              builder: (context, calculatorState, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(
                  color: Colors.black,
                ),
                Text(
                  'All Questions',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          '${index + 1}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        title: Text(
                          '${calculatorState.customQuestions[index].question}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        trailing: Text(
                          '${calculatorState.customQuestions[index].answerValue}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        subtitle: Text(
                          '${calculatorState.customQuestions[index].answer}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/questions');
                        },
                      );
                    },
                    itemCount: calculatorState.customQuestions.length,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

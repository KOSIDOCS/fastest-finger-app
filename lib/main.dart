import 'dart:io';

import 'package:fastest_finger_calculator/Calculator/application/calculator_state.dart';
import 'package:fastest_finger_calculator/Calculator/application/theme_state.dart';
import 'package:fastest_finger_calculator/Calculator/main_calculator_web.dart';
import 'package:fastest_finger_calculator/Calculator/screens/all_questions.dart';
import 'package:fastest_finger_calculator/Calculator/screens/questions_screen.dart';
import 'package:fastest_finger_calculator/core/theme/theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Calculator/main_calculator.dart';
import 'Calculator/main_calculator_desktop.dart';

void main() {
  // if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
  //   setWindowTitle('Fastest Finger Calculator');
  //   setWindowMinSize(const Size(587.0, 0.0));
  //   setWindowMaxSize(Size.infinite);
  // }
  // if (!kIsWeb) {
  //   setWindowTitle('Fastest Finger Calculator');
  //   setWindowMinSize(const Size(587.0, 700.0));
  //   // setWindowMaxSize(Size.infinite);
  //   setWindowMaxSize(const Size(587.0, 900.0));
  // }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeState()),
        ChangeNotifierProvider(create: (context) => CalculatorState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(builder: (context, themeState, child) {
      return MaterialApp(
        title: 'Fastest Finger App',
        theme: themeState.isDark ? themeDark : themeLight,
        //darkTheme: themeDark,
        //themeMode: ThemeMode.system,
        home: const EntryPoint(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF674CE8),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: MediaQuery.of(context).size.width <= 700 ? null : 0.5,
            heightFactor:
                MediaQuery.of(context).size.width <= 700 ? null : 0.95,
            alignment: FractionalOffset.center,
            child: const MainCalculatorWeb(),
          ),
        ),
      );
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const MainCalculatorDesktop(),
      );
    } else {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF9d7fff),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/index-finger-gesture.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                // ListTile(
                //   title: Text(context.read<CalculatorState>().question1),
                //   onTap: () {
                //     // Update the state of the app
                //     // ...
                //     // Then close the drawer
                //     Navigator.pop(context);
                //   },
                // ),
                ListTile(
                  title: const Text('Create question'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const QuestionsScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('View All questions'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AllQuestions(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: const MainCalculator(),
        ),
      );
    }
  }
}

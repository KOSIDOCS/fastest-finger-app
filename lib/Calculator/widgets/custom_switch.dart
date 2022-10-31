import 'package:fastest_finger_calculator/Calculator/application/theme_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchBtn extends StatefulWidget {
  const SwitchBtn({Key? key}) : super(key: key);

  @override
  State<SwitchBtn> createState() => _SwitchBtnState();
}

class _SwitchBtnState extends State<SwitchBtn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAc;

  late Animation<Color?> _animation;
  late Animation<Color?> _backgroundColor;

  @override
  void initState() {
    super.initState();
    _controllerAc = AnimationController(
      //<-- initialize a controller
      vsync: this,
      duration: const Duration(milliseconds: 600),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    _animation = ColorTween(
      begin: const Color(0xFF0b2742),
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _controllerAc,
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    _backgroundColor = ColorTween(
      begin: Colors.white,
      end: const Color(0xFF0b2742),
    ).animate(CurvedAnimation(
      parent: _controllerAc,
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));
  }

  @override
  void dispose() {
    _controllerAc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controllerAc,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(2.0),
            margin: const EdgeInsets.only(left: 25.0, right: 25.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFF0b2742),
            ),
            child: Container(
              height: 30.0,
              width: 90.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _backgroundColor.value,
              ),
              child: Stack(
                children: [
                  InkWell(
                    enableFeedback: false,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    onTap: () {
                      if (kDebugMode) {
                        print('tapped ${_controllerAc.status}');
                      }
                      switch (_controllerAc.status) {
                        case AnimationStatus.completed:
                          _controllerAc.reverse();
                          changeTheme();
                          break;
                        case AnimationStatus.dismissed:
                          _controllerAc.forward();
                          changeTheme();
                          break;
                        default:
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: AnimatedBuilder(
                        animation: _controllerAc,
                        builder: (BuildContext context, Widget? child) {
                          return Transform.translate(
                            offset: Offset(55.0 * _controllerAc.value, 1.6),
                            child: Container(
                              alignment: const Alignment(-0.83, -0.6),
                              child: CircleAvatar(
                                radius: 12.0,
                                backgroundColor: _animation.value,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void changeTheme() {
    context.read<ThemeState>().toggleTheme();
    //final page = ModalRoute.of(context);
    // if (!Get.isDarkMode) {
    //   Get.changeTheme(mentalHealthThemeDark);
    //   page!.didPush().then((x) {
    //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //   });
    // } else {
    //   Get.changeTheme(mentalHealthThemeLight);
    //   page!.didPush().then((x) {
    //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    //   });
    // }
  }
}

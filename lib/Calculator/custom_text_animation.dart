import 'package:flutter/material.dart';

class CustomAnimatedText extends StatefulWidget {
  final String text;
  final IconData? icon;
  const CustomAnimatedText({Key? key, required this.text, this.icon}) : super(key: key);
  static const title = 'Custom Animated Text';

  @override
  State<CustomAnimatedText> createState() => _CustomAnimatedTextState();
}

class _CustomAnimatedTextState extends State<CustomAnimatedText>
    with TickerProviderStateMixin {
  late AnimationController textController;
  late Animation<double> textAnimation;
  @override
  void initState() {
    super.initState();

    textController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    textAnimation = Tween<double>(begin: 20, end: 1).animate(textController);
    textController.forward(from: 0.0);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: textController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(textAnimation.value * 2, 0),
            child: widget.icon != null ? Transform.translate(
              offset: const Offset(0.0, 14.0),
              child: Icon(
                    widget.icon,
                    size: 26,
                    color: const Color(0xFF9d7fff),
                  ),
            ) : Text(
              widget.text,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
        });
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatefulWidget {
  const OnBoardingButton({required this.text, this.onPressed, super.key});

  final String text;
  final VoidCallback? onPressed;

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

enum ButtonState { init, loading, done }

class _OnBoardingButtonState extends State<OnBoardingButton> {
  bool isAnimating = false;
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    bool isStretched = !isAnimating || state == ButtonState.init;
    bool isDone = state == ButtonState.done;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      width: state == ButtonState.init ? 200 : 50,
      onEnd: () => setState(() => isAnimating = !isAnimating),
      child: SizedBox(
        height: 55,
        child: isStretched ? buildButton() : buildSmallButton(isDone),
      ),
    );
  }

  Widget buildButton() => OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(
              color: context.theme.colorScheme.secondary.withOpacity(0.4),
              width: 2,
            ),
            backgroundColor: context.theme.colorScheme.primaryContainer),
        onPressed: () async {
          setState(() {
            state = ButtonState.loading;
          });
          await Future.delayed(const Duration(seconds: 1));

          setState(() {
            state = ButtonState.done;
          });

          await Future.delayed(const Duration(seconds: 1));

          widget.onPressed?.call();

          setState(() {
            state = ButtonState.init;
          });
        },
        child: AutoSizeText(
          widget.text,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w900),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget buildSmallButton(bool isDone) {
    final color = isDone
        ? const Color.fromARGB(255, 38, 88, 40)
        : context.theme.colorScheme.primaryContainer;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: isDone
          ? const Icon(Icons.done, color: Colors.white)
          : const CircularProgressIndicator(
              color: Color.fromARGB(255, 38, 88, 40)),
    );
  }
}

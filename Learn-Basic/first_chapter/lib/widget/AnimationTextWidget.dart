import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimationTextWidget extends StatelessWidget {
  const AnimationTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Text Widget',
            style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1)),
        backgroundColor: const Color.fromARGB(255, 7, 170, 215),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Sagar Shah',
                    textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                    speed: const Duration(milliseconds: 100)),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 200),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(
                  'Hello',
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                RotateAnimatedText(
                  'World',
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                RotateAnimatedText(
                  'Flutter',
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
              ],
              // totalRepeatCount: 4,
              // pause: const Duration(milliseconds: 200),
              // displayFullTextOnTap: true,
              // stopPauseOnTap: true,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(animatedTexts: [
              WavyAnimatedText('Wavey Text Animation',
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              WavyAnimatedText('Wavey Text Animation',
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
            ])
          ],
        ),
      ),
    );
  }
}

import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:four_foto_one_word/widgets/game_screen.dart';
import 'package:four_foto_one_word/widgets/info.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            ),
            Positioned.fill(
              child: FloatingBubbles(
                noOfBubbles: 25,
                colorsOfBubbles: const [
                  Colors.green,
                  Colors.red,
                  Colors.blue,
                  Colors.teal,
                ],
                sizeFactor: 0.29,
                duration: 999999999999999999,
                // 120 seconds.
                opacity: 70,
                paintingStyle: PaintingStyle.fill,
                strokeWidth: 12,
                shape: BubbleShape.circle,
                // circle is the default. No need to explicitly mention if its a circle.
                speed: BubbleSpeed.normal, // normal is the default
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              child: AnimatedButton(
                height: 32,
                width: 64,
                text: 'Info',
                isReverse: true,
                selectedTextColor: Colors.green,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                backgroundColor: Colors.green,
                borderRadius: 50,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Info()));
                },
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: ShapeDecoration(
                  color: Colors.blue,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48),
                    borderSide: const BorderSide(width: 2),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
                  },
                  child: Center(
                    child: Text(
                      "Game",
                      style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width * 0.15) - 2,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

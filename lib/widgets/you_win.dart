import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:four_foto_one_word/widgets/splash.dart';

class YouWin extends StatefulWidget {
  const YouWin({super.key});

  @override
  State<YouWin> createState() => _YouWinState();
}

class _YouWinState extends State<YouWin> {

  @override
  void initState() {
    super.initState();
    pushReplecmentNavigatio();
  }

  Future<void> pushReplecmentNavigatio() async {
    Future.delayed(const Duration(seconds: 10)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Splash()))
    });
  }

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
                opacity: 70,
                paintingStyle: PaintingStyle.fill,
                strokeWidth: 12,
                shape: BubbleShape.circle,
                speed: BubbleSpeed.normal, // normal is the default
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 70.0,
                      fontFamily: 'Canterbury',
                      color: Colors.green,
                      fontWeight: FontWeight.w900
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('YOU WIN'),
                        ScaleAnimatedText('YOU WIN'),
                        ScaleAnimatedText('YOU WIN'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
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

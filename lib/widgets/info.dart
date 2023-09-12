import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: const Center(
                  child: Text(
                    """You are given 3 coins per match which means you have 3 chances to get help per match. For each help you receive, you will be charged a coin.
                      Editor: M. Sherali.""",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
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

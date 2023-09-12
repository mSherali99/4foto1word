import 'package:flutter/material.dart';
import 'package:four_foto_one_word/widgets/game_screen.dart';
import 'package:four_foto_one_word/widgets/splash.dart';
import 'package:four_foto_one_word/widgets/you_win.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}


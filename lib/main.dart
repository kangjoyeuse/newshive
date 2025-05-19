import 'package:flutter/material.dart';
import 'package:newshive/pages/introduction_screen.dart';

void main() => runApp(Newshive());

class Newshive extends StatelessWidget {
  const Newshive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Default App',
      home: IntroductionScreen(),
    );
  }
}
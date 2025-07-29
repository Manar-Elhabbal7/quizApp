import 'dart:math';
import 'package:flutter/material.dart';

const Alignment start = Alignment.bottomCenter;
const Alignment end = Alignment.topCenter;

const List<Color> gradientColors = [
  Color(0xFF222831),
  Color(0xFF393E46),
  Color(0xFF948979),
];

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  String image = 'images/one.png';

  void rollDice() {
    const diceNames = ['one', 'two', 'three', 'four', 'five', 'six'];
    final idx = Random().nextInt(6); 
    setState(() {
      image = 'images/${diceNames[idx]}.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: start,
          end: end,
          colors: gradientColors,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            ElevatedButton.icon(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              label: const Text(
                'Roll Dice',
                style: TextStyle(color: Colors.black),
              ),
              icon: const Icon(Icons.casino, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

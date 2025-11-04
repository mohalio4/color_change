import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  int red = 255;
  int green = 255;
  int blue = 255;
  int directionIndex = 0;

  final List<String> directions = ['Vertical', 'Horizontal', 'Left-Right', 'Right-Left'];
  final Random random = Random();

  void changeColor() {
    setState(() {
      red = random.nextInt(256);
      green = random.nextInt(256);
      blue = random.nextInt(256);
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % 4;
    });
  }

  AlignmentGeometry getBeginAlignment() {
    switch (directionIndex) {
      case 0: // Vertical
        return Alignment.topCenter;
      case 1: // Horizontal
        return Alignment.centerLeft;
      case 2: // Left-Right
        return Alignment.centerLeft;
      case 3: // Right-Left
        return Alignment.centerRight;
      default:
        return Alignment.topCenter;
    }
  }

  AlignmentGeometry getEndAlignment() {
    switch (directionIndex) {
      case 0: // Vertical
        return Alignment.bottomCenter;
      case 1: // Horizontal
        return Alignment.centerRight;
      case 2: // Left-Right
        return Alignment.centerRight;
      case 3: // Right-Left
        return Alignment.centerLeft;
      default:
        return Alignment.bottomCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: getBeginAlignment(),
            end: getEndAlignment(),
            colors: [
              Color.fromRGBO(red, green, blue, 1),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Red: $red',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Green: $green',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Blue: $blue',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: changeColor,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Change Color',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeDirection,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Change Direction',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
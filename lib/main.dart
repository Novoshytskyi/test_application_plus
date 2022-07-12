import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const _Main());
}

class _Main extends StatelessWidget {
  const _Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  Color? _randomBackgroundColor;
  Alignment _randomTextPosition = Alignment.center;
  Color? _randomTextColor;

  @override
  void initState() {
    _randomBackgroundColor = _generateColor();
    _randomTextPosition = Alignment.center;
    _randomTextColor = _generateColor();
    super.initState();
  }

  void _setRandomBackgroundColor() {
    setState(() {
      _randomBackgroundColor = _generateColor();
    });
  }

  void _setRandomTextColor() {
    setState(() {
      do {
        _randomTextColor = _generateColor();
      } while (_randomBackgroundColor == _randomTextColor);
    });
  }

  void _setRandomTextPosition() {
    setState(() {
      _randomTextPosition = _generatePosition();
    });
  }

  Color _generateColor() {
    // r, g, b - from 0 to 255 (256 * 256 * 256 = 16 777 216 colors)
    const int maxCountOfColorParameter = 256;

    return Color.fromRGBO(
      Random().nextInt(maxCountOfColorParameter),
      Random().nextInt(maxCountOfColorParameter),
      Random().nextInt(maxCountOfColorParameter),
      1,
    );
  }

  Alignment _generatePosition() {
    const maxCountOfPosition = 9;
    const listOfPosition = [
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
    ];

    return listOfPosition[Random().nextInt(maxCountOfPosition)];
  }

  @override
  Widget build(BuildContext context) {
    const double sizeTextOnScreen = 40.0;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _setRandomBackgroundColor();
          _setRandomTextColor();
          _setRandomTextPosition();
        },
        child: Container(
          color: _randomBackgroundColor,
          alignment: _randomTextPosition,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 40, 5, 5),
            child: Text(
              'Hey there',
              style: TextStyle(
                color: _randomTextColor,
                fontSize: sizeTextOnScreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

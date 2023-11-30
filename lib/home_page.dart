import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cubixd/cubixd.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
 with TickerProviderStateMixin{
  Random random = Random();
  int currentImageIndex = 0;
  int counter = 1;
  List<String> images = [
    'assets/images/dice_1.png',
    'assets/images/dice_2.png',
    'assets/images/dice_3.png',
    'assets/images/dice_4.png',
    'assets/images/dice_5.png',
    'assets/images/dice_6.png',
  ];
  late AnimationController _animationController;
  int _diceValue = 1;
  Tween<double> _rotationXTween = Tween(begin: 0.0, end: 360.0);
  Tween<double> _rotationYTween = Tween(begin: 0.0, end: 360.0);
  Tween<double> _rotationZTween = Tween(begin: 0.0, end: 360.0);
  double _currentRotation = 0;

  @override

  
 @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      lowerBound: -90.0,
      upperBound: 90.0, vsync: this,
    );
  }

  void updateDiceRollAnimation(double value) {
    _currentRotation = value;
    _animationController.animateTo(value);
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform(
            transform: Matrix4.identity()
              ..rotateY(_currentRotation),
            child: CubixD(
              delta: (Vector2(0, 0)),
              top: Container(
            color: Colors.red,
          ),
          bottom: Container(
            color: Colors.pink,
          ),
          left: Container(
            color: Colors.blue,
          ),
          right: Container(
            color: Colors.yellow,
          ),
          front: Container(
            color: Colors.amber,
          ),
          back: Container(
            color: Colors.greenAccent,
          ),
              size: 200.0,
              // color: Colors.blue,
              // material: CubixDMaterial(
              //   shininess: 10.0,
              //   reflectance: 0.2,
              // ),
            ),
          ),
          GestureDetector(
            onPanUpdate: (detailss) {
              if (detailss.delta.dx > 100) {
                // Roll the dice
                updateDiceRollAnimation(detailss.delta.dx);
              } else if (detailss.delta.dx < -100) {
                // Roll the dice
                updateDiceRollAnimation(detailss.delta.dx);
              }
            },
            child: Container(
              color: Colors.green,
              child: Center(child: Text('Roll the dice')),
            ),
          ),
        ],
      ),
    );
  }
}

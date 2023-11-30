import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FallingImageScreen(),
    );
  }
}

class FallingImageScreen extends StatefulWidget {
  @override
  _FallingImageScreenState createState() => _FallingImageScreenState();
}

class _FallingImageScreenState extends State<FallingImageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double imageSize = 500.0; // Initial image size
  final double minImageSize = 100.0; // Minimum image size
  // double minBottom = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {
    //     minBottom = (MediaQuery.of(context).size.height / 2);
    //     print(minBottom);
    //   });
    // });
    _animation = Tween<Offset>(
      begin: Offset(2, 7),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        // Reduce the image size as the animation progresses
        imageSize = 200.0 - (200.0 * _controller.value);
        // Prevent further resizing when the image size reaches the minimum value
        if (imageSize < minImageSize) {
          imageSize = minImageSize;
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 350),
          width: imageSize,
          height: imageSize,
          child: SlideTransition(
            position: _animation,
            child: Image.asset('assets/images/dice.jpeg', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

// 3d dice
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  AudioPlayer player = AudioPlayer();
  Offset _offset = Offset.zero;
  void _incrementCounter(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: ((details) {
          setState(() => _offset += details.delta);
        }),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_offset.dy * pi / 100)
                  ..rotateY(_offset.dx * pi / 100),
                  alignment: Alignment.center,
                  child: Center(child: Cube())
                ),
                SizedBox(height: 32,),
                // Slider(
                //   value: _offset.dy,
                //   min: 0,
                //   max:  pi * 2,
                //   onChanged: (value) {
                //     setState(() {
                //       _offset = Offset(0, value);
                //     });
                //   },
                // )
            ],
          ),
          ),
      );
  }
}


class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
          ..translate(0.0, 0.0, -50.0),
          // ..setEntry(3, 2, 0.001)
          // ..rotateX(_offset.dy * pi / 100)
          // ..rotateY(-pi / 2),
          child: Container(
            color: Colors.red,
            // height: 100,
            // width: 100,
            // child: FlutterLogo(size: 100,)
            child: Image.asset("assets/images/dice_1.png", height: 100),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
          ..translate(0.0, 50.0, 0.0)
          // ..setEntry(3, 2, 0.001)
          // ..rotateX(_offset.dy * pi / 100)
          ..rotateX(pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.purple,
            // height: 100,
            // width: 100,
            // child: FlutterLogo(size: 100,)
            child: Image.asset("assets/images/dice_2.png", height: 100),
          ),
        ),
        Transform( //STARTBOARD side
          transform: Matrix4.identity()
          ..translate(50.0, 0.0, 0.0)
          // ..setEntry(3, 2, 0.001)
          // ..rotateX(_offset.dy * pi / 100)
          ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.blue,
            // child: FlutterLogo(size: 100,)
            child: Image.asset("assets/images/dice_3.png", height: 100),
            // height: 100,
            // width: 100,
          ),
        ),
        // Transform( //STARTBOARD side
        //   transform: Matrix4.identity()
        //   ..translate(50.0, 0.0, 0.0)
        //   // ..setEntry(3, 2, 0.001)
        //   // ..rotateX(_offset.dy * pi / 100)
        //   ..rotateY(-pi / 2),
        //   alignment: Alignment.center,
        //   child: Container(
        //     color: Colors.blue,
        //     // child: FlutterLogo(size: 100,)
        //     child: Image.asset("assets/images/dice_3.png", height: 100),
        //     // height: 100,
        //     // width: 100,
        //   ),
        // ),
      ]
    );
  }
}
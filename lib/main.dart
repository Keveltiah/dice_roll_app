import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Random Video Player'),
        // ),
        body: Center(
          child: RandomVideoPlayer(),
        ),
      ),
    );
  }
}

class RandomVideoPlayer extends StatefulWidget {
  @override
  _RandomVideoPlayerState createState() => _RandomVideoPlayerState();
}

class _RandomVideoPlayerState extends State<RandomVideoPlayer> {
  late VideoPlayerController _controller;
  late int tentativeCourrante;
  List<String> winningvideoUrls = [
    'assets/videos/Somme4.mp4',
    'assets/videos/Somme6.mp4',
    'assets/videos/Somme7.mp4'
  ];

  List<String> loosingvideoUrls = [
    'assets/videos/Somme2.mp4',
    'assets/videos/Somme8.mp4',
    'assets/videos/Somme9.mp4',
    'assets/videos/Somme11.mp4'
  ];

  @override
  void initState() {
    super.initState();
    tentativeCourrante = 1;
    _controller = VideoPlayerController.asset('assets/videos/init.mp4'
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
          behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                if (tentativeCourrante > 21){
                  print("+++++++++Reinitialisation a 1");
                  tentativeCourrante = 1;
                }
              });
              if([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)){
                print('OKOKOKOKO');
              }
              print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
              ? winningvideoUrls[Random().nextInt(winningvideoUrls.length)]
              : loosingvideoUrls[Random().nextInt(loosingvideoUrls.length)]);
              
              _controller.dispose();

              _controller = VideoPlayerController.asset(
                [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
              ? winningvideoUrls[Random().nextInt(winningvideoUrls.length)]
              : loosingvideoUrls[Random().nextInt(loosingvideoUrls.length)]
              )..initialize().then((_) {
                setState(() {
                  print("+++++++++++Numbre de lance");
                  print(tentativeCourrante);
                  tentativeCourrante += 1;
                });
                
                _controller.setVolume(0);
                _controller.play();
              });
            },
            child: VideoPlayer(_controller)
            // child: AspectRatio(
            //   aspectRatio: _controller.value.aspectRatio,
            //   child: VideoPlayer(_controller),
            // ),
          )
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

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
  late int icolor;
  late String couleurDe;
  
  List<Color> AvailableColors = [
    Colors.green,
    Colors.red,
    Colors.black,
    Colors.white,
    Colors.blue,
    Colors.yellow
  ];


  late String fond;
  List<String> winningvideoUrls = [
    'assets/videos/Somme4_gazon_denoir.mp4',
    'assets/videos/Somme6_gazon_denoir.mp4',
    'assets/videos/Somme7_gazon_denoir.mp4',
    'assets/videos/Somme3_gazon_denoir.mp4',
    'assets/videos/Somme5_gazon_denoir.mp4'
  ];

  List<String> loosingvideoUrls = [
    'assets/videos/Somme2_gazon_denoir.mp4',
    'assets/videos/Somme8_gazon_denoir.mp4',
    'assets/videos/Somme9_gazon_denoir.mp4',
    'assets/videos/Somme11_gazon_denoir.mp4',
    'assets/videos/Somme10_gazon_denoir.mp4',
    'assets/videos/Somme12_gazon_denoir.mp4'
  ];

  @override
  void initState() {
    super.initState();
    tentativeCourrante = 1;
    icolor = 0;
    // final prefs = await SharedPreferences.getInstance();

    _controller = VideoPlayerController.asset('assets/videos/init.mp4'
    )..initialize().then((_) {
        setState(() {});
      });
  }

  dynamic (BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      int index = 0;
      return AlertDialog(
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return ListView(
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Dice color',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                TextButton(
                  onPressed: () => {
                    
                  },
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: FloatingActionButton(
                      child: Image.asset(
                        'assets/images/back.jpg',
                        width: 25,
                      ),
                      onPressed: (){
                        print("back pressed");
                        setState(() {
                          index += 1;
                          if (index > 5){
                            index = 0;
                          }
                          print(index);
                          icolor = index;
                        });
                      }
                    ),
                  )
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AvailableColors[index],
                      // borderRadius: BorderRadius.all(Radius.circular(15),),
                      // border: Border.all(
                      //   color: Colors.white, // Set the border color here
                      //   width: 5, // Set the border width here
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    
                  },
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: FloatingActionButton(
                    child: Image.asset(
                      'assets/images/front.jpg',
                      width: 25,
                    ),
                    onPressed: (){
                      print("toto");
                    }
                  ),
                  )
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  'Background',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text("1"),
                Text("1"),
                Text("1"),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  'Show results',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text("1"),
                Text("1"),
                Text("1"),
              ],
            ),
          ],
        );
            },
          ),
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  print(icolor);
                  print("+++++++++++Numbre de lance");
                  print(tentativeCourrante);
                  tentativeCourrante += 1;
                });
                
                _controller.setVolume(0);
                _controller.play();
              });
            },
            child: Stack(
              children: [
                VideoPlayer(_controller),
                  Positioned(
                    // top: 0,
                    // right: 0,
                    left: 125,
                    bottom: 10,
                    width: 40,
                    child: FloatingActionButton(
                      child: Image.asset('assets/images/quit.jpg'),
                      onPressed: (){
                        print("toto");
                      }
                    ),
                  ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 185,
                    bottom: 10,
                    width: 40,
                    child: FloatingActionButton(
                    child: Image.asset('assets/images/help.jpg'),
                    onPressed: (){
                      print("toto");
                    }
                  ),
                ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 245,
                    bottom: 10,
                    width: 40,
                    child: FloatingActionButton(
                    child: Image.asset('assets/images/help2.jpg'),
                    onPressed: (){
                      print("toto");
                    }
                  ),
                ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 300,
                    bottom: 10,
                    width: 40,
                    child: FloatingActionButton(
                      child: Image.asset('assets/images/settings.jpg'),
                      onPressed: (){
                      print("setting pressed");
                      dynamic(context);
                    }
                  ),
                ),
              ],
            )
            // child: AspectRatio(
            //   aspectRatio: _controller.value.aspectRatio,
            //   child: VideoPlayer(_controller),
            // ),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
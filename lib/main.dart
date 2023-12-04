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
  late int icolorbg;
  late String couleurDe;
  
  List<String> AvailableColors = [
    'assets/images/bleu.jpg',
    'assets/images/rouge.jpg',
    'assets/images/vert.jpg',
    'assets/images/noir.jpg',
    'assets/images/blanc.jpg',
    'assets/images/jaune.jpg',
  ];

  List<String> AvailableBackgrounds = [
    'assets/images/backgroundgvert.jpg',
    'assets/images/backgroundmarron.jpg',
    'assets/images/backgroundblanc.jpg',
    'assets/images/backgroundblanc2.jpg',
    'assets/images/backgroundmarron2.jpg',
    'assets/images/backgroundblancraille.jpg',
  ];


  late String fond;
  List<String> winningvideoUrlsGazonDevert = [
    'assets/videos/Somme4_gazon_devert.mp4',
    'assets/videos/Somme6_gazon_devert.mp4',
    'assets/videos/Somme7_gazon_devert.mp4',
    'assets/videos/Somme3_gazon_devert.mp4',
    'assets/videos/Somme5_gazon_devert.mp4'
  ];

  List<String> loosingvideoUrlsGazonDevert = [
    'assets/videos/Somme2_gazon_devert.mp4',
    'assets/videos/Somme8_gazon_devert.mp4',
    'assets/videos/Somme9_gazon_devert.mp4',
    'assets/videos/Somme11_gazon_devert.mp4',
    'assets/videos/Somme10_gazon_devert.mp4',
    'assets/videos/Somme12_gazon_devert.mp4'
  ];

  List<String> winningvideoUrlsGazonDebleu = [
    'assets/videos/Somme4_gazon_debleu.mp4',
    'assets/videos/Somme6_gazon_debleu.mp4',
    'assets/videos/Somme7_gazon_debleu.mp4',
    'assets/videos/Somme3_gazon_debleu.mp4',
    'assets/videos/Somme5_gazon_debleu.mp4'
  ];

  List<String> loosingvideoUrlsGazonDebleu = [
    'assets/videos/Somme2_gazon_debleu.mp4',
    'assets/videos/Somme8_gazon_debleu.mp4',
    'assets/videos/Somme9_gazon_debleu.mp4',
    'assets/videos/Somme11_gazon_debleu.mp4',
    'assets/videos/Somme10_gazon_debleu.mp4',
    'assets/videos/Somme12_gazon_debleu.mp4'
  ];

  List<String> winningvideoUrlsGazonDerouge = [
    'assets/videos/Somme4_gazon_derouge.mp4',
    'assets/videos/Somme6_gazon_derouge.mp4',
    'assets/videos/Somme7_gazon_derouge.mp4',
    'assets/videos/Somme3_gazon_derouge.mp4',
    'assets/videos/Somme5_gazon_derouge.mp4'
  ];

  List<String> loosingvideoUrlsGazonDerouge = [
    'assets/videos/Somme2_gazon_derouge.mp4',
    'assets/videos/Somme8_gazon_derouge.mp4',
    'assets/videos/Somme9_gazon_derouge.mp4',
    'assets/videos/Somme11_gazon_derouge.mp4',
    'assets/videos/Somme10_gazon_derouge.mp4',
    'assets/videos/Somme12_gazon_derouge.mp4'
  ];

  List<String> winningvideoUrlsGazonDeblanc = [
    'assets/videos/Somme4_gazon_deblanc.mp4',
    'assets/videos/Somme6_gazon_deblanc.mp4',
    'assets/videos/Somme7_gazon_deblanc.mp4',
    'assets/videos/Somme3_gazon_deblanc.mp4',
    'assets/videos/Somme5_gazon_deblanc.mp4'
  ];

  List<String> loosingvideoUrlsGazonDeblanc = [
    'assets/videos/Somme2_gazon_deblanc.mp4',
    'assets/videos/Somme8_gazon_deblanc.mp4',
    'assets/videos/Somme9_gazon_deblanc.mp4',
    'assets/videos/Somme11_gazon_deblanc.mp4',
    'assets/videos/Somme10_gazon_deblanc.mp4',
    'assets/videos/Somme12_gazon_deblanc.mp4'
  ];

  List<String> winningvideoUrlsGazonDenoir = [
    'assets/videos/Somme4_gazon_denoir.mp4',
    'assets/videos/Somme6_gazon_denoir.mp4',
    'assets/videos/Somme7_gazon_denoir.mp4',
    'assets/videos/Somme3_gazon_denoir.mp4',
    'assets/videos/Somme5_gazon_denoir.mp4'
  ];

  List<String> loosingvideoUrlsGazonDenoir = [
    'assets/videos/Somme2_gazon_denoir.mp4',
    'assets/videos/Somme8_gazon_denoir.mp4',
    'assets/videos/Somme9_gazon_denoir.mp4',
    'assets/videos/Somme11_gazon_denoir.mp4',
    'assets/videos/Somme10_gazon_denoir.mp4',
    'assets/videos/Somme12_gazon_denoir.mp4'
  ];

  List<String> winningvideoUrlsGazonDejaune = [
    'assets/videos/Somme4_gazon_dejaune.mp4',
    'assets/videos/Somme6_gazon_dejaune.mp4',
    'assets/videos/Somme7_gazon_dejaune.mp4',
    'assets/videos/Somme3_gazon_dejaune.mp4',
    'assets/videos/Somme5_gazon_dejaune.mp4'
  ];

  List<String> loosingvideoUrlsGazonDejaune = [
    'assets/videos/Somme2_gazon_dejaune.mp4',
    'assets/videos/Somme8_gazon_dejaune.mp4',
    'assets/videos/Somme9_gazon_dejaune.mp4',
    'assets/videos/Somme11_gazon_dejaune.mp4',
    'assets/videos/Somme10_gazon_dejaune.mp4',
    'assets/videos/Somme12_gazon_dejaune.mp4'
  ];

  @override
  void initState() {
    super.initState();
    tentativeCourrante = 1;
    icolor = 0;
    icolorbg = 0;
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
      int indexbg = 0;
      return AlertDialog(
        content: Container(
          height: 220,
          child: StatefulBuilder(
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
                        Padding(padding: EdgeInsets.only(left: 50)),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
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
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                              AvailableColors[index],
                              width: 25,
                            )
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            child: Image.asset(
                              'assets/images/front.jpg',
                              width: 25,
                            ),
                            onPressed: (){
                              print("front pressed");
                              setState(() {
                                index -= 1;
                                if (index < 0){
                                  index = 5;
                                }
                                print(index);
                                icolor = index;
                              });
                            }
                          ),
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
                        Padding(padding: EdgeInsets.only(left: 37)),
                        SizedBox(
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
                                indexbg += 1;
                                if (indexbg > 5){
                                  indexbg = 0;
                                }
                                print(indexbg);
                                icolorbg = indexbg;
                              });
                            }
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                              AvailableBackgrounds[indexbg],
                              width: 25,
                            )
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            child: Image.asset(
                              'assets/images/front.jpg',
                              width: 25,
                            ),
                            onPressed: (){
                              print("front pressed");
                              setState(() {
                                indexbg -= 1;
                                if (indexbg < 0){
                                  indexbg = 5;
                                }
                                print(indexbg);
                                icolorbg = indexbg;
                              });
                            }
                          ),
                        ),
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
                        Padding(padding: EdgeInsets.only(left: 50)),
                        // Text("1"),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: TextButton(
                          onPressed: () => {
                            Navigator.of(context).pop()
                          },
                          child: Image.asset(
                            'assets/images/close.jpg',
                            width: 70,
                          ),
                      ),
                    )
                  ],
                );
              },
            ),
        )
      );
    }
  );
}

dynamicHelp (BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
          child: TextButton(
              onPressed: () => {
                Navigator.of(context).pop()
              },
              child: Image.asset(
                'assets/images/helpText.jpg',
                width: 300,
              ),
          ),
      );
    }
  );
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
              _controller.dispose();
              print("couleur du de");
              print(icolor);
              print("couleur background");
              print(icolorbg);
              if (icolor == 0){
                // De bleu
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDebleu[Random().nextInt(winningvideoUrlsGazonDebleu.length)]
                  : loosingvideoUrlsGazonDebleu[Random().nextInt(loosingvideoUrlsGazonDebleu.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDebleu[Random().nextInt(winningvideoUrlsGazonDebleu.length)]
                  : loosingvideoUrlsGazonDebleu[Random().nextInt(loosingvideoUrlsGazonDebleu.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                      tentativeCourrante += 1;
                    });
                    print(_controller.dataSource);
                    _controller.setVolume(0);
                    _controller.play();
                  });
                }
              }
              if (icolor == 2){
                // De vert
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDevert[Random().nextInt(winningvideoUrlsGazonDevert.length)]
                  : loosingvideoUrlsGazonDevert[Random().nextInt(loosingvideoUrlsGazonDevert.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDevert[Random().nextInt(winningvideoUrlsGazonDevert.length)]
                  : loosingvideoUrlsGazonDevert[Random().nextInt(loosingvideoUrlsGazonDevert.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                      tentativeCourrante += 1;
                    });
                    
                    _controller.setVolume(0);
                    _controller.play();
                  });
                }
              }
              if (icolor == 1){
                // De rouge
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDerouge[Random().nextInt(winningvideoUrlsGazonDerouge.length)]
                  : loosingvideoUrlsGazonDerouge[Random().nextInt(loosingvideoUrlsGazonDerouge.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDerouge[Random().nextInt(winningvideoUrlsGazonDerouge.length)]
                  : loosingvideoUrlsGazonDerouge[Random().nextInt(loosingvideoUrlsGazonDerouge.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                      tentativeCourrante += 1;
                    });
                    
                    _controller.setVolume(0);
                    _controller.play();
                  });
                }
              }
              if (icolor == 4){
                // De blanc
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDeblanc[Random().nextInt(winningvideoUrlsGazonDeblanc.length)]
                  : loosingvideoUrlsGazonDeblanc[Random().nextInt(loosingvideoUrlsGazonDeblanc.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDeblanc[Random().nextInt(winningvideoUrlsGazonDeblanc.length)]
                  : loosingvideoUrlsGazonDeblanc[Random().nextInt(loosingvideoUrlsGazonDeblanc.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                      tentativeCourrante += 1;
                    });
                    
                    _controller.setVolume(0);
                    _controller.play();
                  });
                }
              }
              if (icolor == 3){
                // De noir
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDenoir[Random().nextInt(winningvideoUrlsGazonDenoir.length)]
                  : loosingvideoUrlsGazonDenoir[Random().nextInt(loosingvideoUrlsGazonDenoir.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDenoir[Random().nextInt(winningvideoUrlsGazonDenoir.length)]
                  : loosingvideoUrlsGazonDenoir[Random().nextInt(loosingvideoUrlsGazonDenoir.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                      tentativeCourrante += 1;
                    });
                    
                    _controller.setVolume(0);
                    _controller.play();
                  });
                }
              }
              if (icolor == 5){
                // De jaune
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDejaune[Random().nextInt(winningvideoUrlsGazonDejaune.length)]
                  : loosingvideoUrlsGazonDejaune[Random().nextInt(loosingvideoUrlsGazonDejaune.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDejaune[Random().nextInt(winningvideoUrlsGazonDejaune.length)]
                  : loosingvideoUrlsGazonDejaune[Random().nextInt(loosingvideoUrlsGazonDejaune.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                      tentativeCourrante += 1;
                    });
                    
                    _controller.setVolume(0);
                    _controller.play();
                  });
                }
              }
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
                    child: GestureDetector(
                      child: Image.asset('assets/images/quit.jpg'),
                      onTap: (){
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
                    child: GestureDetector(
                    child: Image.asset('assets/images/help.jpg'),
                    onTap: (){
                      // dynamicHelp(context);
                    }
                  ),
                ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 245,
                    bottom: 10,
                    width: 40,
                    child: GestureDetector(
                    child: Image.asset('assets/images/help2.jpg'),
                    onTap: (){
                      dynamicHelp(context);
                    }
                  ),
                ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 300,
                    bottom: 10,
                    width: 40,
                    child: GestureDetector(
                      child: Image.asset('assets/images/settings.jpg'),
                      onTap: (){
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
          )
        : Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/gazon.jpg',
            fit: BoxFit.cover,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
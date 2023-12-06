import 'dart:io';

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
  late VideoPlayerController _controllerInit;
  late int tentativeCourrante;
  late int icolor;
  late int icolorbg;
  late String couleurDe;
  late bool showHelp;
  
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

  List<String> winningvideoUrlsTapiMarronDebleu = [
    'assets/videos/Somme4_tapi_marron_debleu.mp4',
    'assets/videos/Somme6_tapi_marron_debleu.mp4',
    'assets/videos/Somme7_tapi_marron_debleu.mp4',
    'assets/videos/Somme3_tapi_marron_debleu.mp4',
    'assets/videos/Somme5_tapi_marron_debleu.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDebleu = [
    'assets/videos/Somme2_tapi_marron_debleu.mp4',
    'assets/videos/Somme8_tapi_marron_debleu.mp4',
    'assets/videos/Somme9_tapi_marron_debleu.mp4',
    'assets/videos/Somme11_tapi_marron_debleu.mp4',
    'assets/videos/Somme10_tapi_marron_debleu.mp4',
    'assets/videos/Somme12_tapi_marron_debleu.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDevert = [
    'assets/videos/Somme4_tapi_marron_devert.mp4',
    'assets/videos/Somme6_tapi_marron_devert.mp4',
    'assets/videos/Somme7_tapi_marron_devert.mp4',
    'assets/videos/Somme3_tapi_marron_devert.mp4',
    'assets/videos/Somme5_tapi_marron_devert.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDevert = [
    'assets/videos/Somme2_tapi_marron_devert.mp4',
    'assets/videos/Somme8_tapi_marron_devert.mp4',
    'assets/videos/Somme9_tapi_marron_devert.mp4',
    'assets/videos/Somme11_tapi_marron_devert.mp4',
    'assets/videos/Somme10_tapi_marron_devert.mp4',
    'assets/videos/Somme12_tapi_marron_devert.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDerouge = [
    'assets/videos/Somme4_tapi_marron_derouge.mp4',
    'assets/videos/Somme6_tapi_marron_derouge.mp4',
    'assets/videos/Somme7_tapi_marron_derouge.mp4',
    'assets/videos/Somme3_tapi_marron_derouge.mp4',
    'assets/videos/Somme5_tapi_marron_derouge.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDerouge = [
    'assets/videos/Somme2_tapi_marron_derouge.mp4',
    'assets/videos/Somme8_tapi_marron_derouge.mp4',
    'assets/videos/Somme9_tapi_marron_derouge.mp4',
    'assets/videos/Somme11_tapi_marron_derouge.mp4',
    'assets/videos/Somme10_tapi_marron_derouge.mp4',
    'assets/videos/Somme12_tapi_marron_derouge.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDeblanc = [
    'assets/videos/Somme4_tapi_marron_deblanc.mp4',
    'assets/videos/Somme6_tapi_marron_deblanc.mp4',
    'assets/videos/Somme7_tapi_marron_deblanc.mp4',
    'assets/videos/Somme3_tapi_marron_deblanc.mp4',
    'assets/videos/Somme5_tapi_marron_deblanc.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDeblanc = [
    'assets/videos/Somme2_tapi_marron_deblanc.mp4',
    'assets/videos/Somme8_tapi_marron_deblanc.mp4',
    'assets/videos/Somme9_tapi_marron_deblanc.mp4',
    'assets/videos/Somme11_tapi_marron_deblanc.mp4',
    'assets/videos/Somme10_tapi_marron_deblanc.mp4',
    'assets/videos/Somme12_tapi_marron_deblanc.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDenoir = [
    'assets/videos/Somme4_tapi_marron_denoir.mp4',
    'assets/videos/Somme6_tapi_marron_denoir.mp4',
    'assets/videos/Somme7_tapi_marron_denoir.mp4',
    'assets/videos/Somme3_tapi_marron_denoir.mp4',
    'assets/videos/Somme5_tapi_marron_denoir.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDenoir = [
    'assets/videos/Somme2_tapi_marron_denoir.mp4',
    'assets/videos/Somme8_tapi_marron_denoir.mp4',
    'assets/videos/Somme9_tapi_marron_denoir.mp4',
    'assets/videos/Somme11_tapi_marron_denoir.mp4',
    'assets/videos/Somme10_tapi_marron_denoir.mp4',
    'assets/videos/Somme12_tapi_marron_denoir.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDejaune = [
    'assets/videos/Somme4_tapi_marron_dejaune.mp4',
    'assets/videos/Somme6_tapi_marron_dejaune.mp4',
    'assets/videos/Somme7_tapi_marron_dejaune.mp4',
    'assets/videos/Somme3_tapi_marron_dejaune.mp4',
    'assets/videos/Somme5_tapi_marron_dejaune.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDejaune= [
    'assets/videos/Somme2_tapi_marron_dejaune.mp4',
    'assets/videos/Somme8_tapi_marron_dejaune.mp4',
    'assets/videos/Somme9_tapi_marron_dejaune.mp4',
    'assets/videos/Somme11_tapi_marron_dejaune.mp4',
    'assets/videos/Somme10_tapi_marron_dejaune.mp4',
    'assets/videos/Somme12_tapi_marron_dejaune.mp4'
  ];

  @override
  void initState() {
    super.initState();
    tentativeCourrante = 1;
    icolor = 0;
    icolorbg = 0;
    showHelp = false;
    // final prefs = await SharedPreferences.getInstance();

    _controller = VideoPlayerController.asset('assets/videos/initVert.mp4'
    )..initialize().then((_) {
        setState(() {});
      });

    _controllerInit = VideoPlayerController.asset('assets/videos/initVert.mp4'
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
      int diceCount = 1;
      return AlertDialog(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 5.0),
          borderRadius: BorderRadius.circular(10.0), // Set the border radius here
        ),
        content: Container(

          height: 250,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return ListView(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Dice count:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Padding(padding: EdgeInsets.only(left: 25)),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                child: Image.asset(
                                  'assets/images/back.jpg',
                                  width: 30,
                                ),
                                onPressed: (){
                                  print("back pressed");
                                  setState(() {
                                    if (diceCount > 1){
                                      diceCount -=1;
                                    }
                                  });
                                }
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 25)),
                        SizedBox(
                          // height: 30,
                          // width: 30,
                          child: Text(diceCount.toString(), style: TextStyle(fontWeight: FontWeight.bold),)
                        ),
                        Padding(padding: EdgeInsets.only(left: 25)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                            child: Image.asset(
                              'assets/images/front.jpg',
                              width: 30,
                            ),
                            onPressed: (){
                              print("front pressed");
                              setState(() {
                                if (diceCount < 5){
                                  diceCount +=1;
                                }
                              });
                            }
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Text(
                          'Dice color:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Padding(padding: EdgeInsets.only(left: 30)),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                child: Image.asset(
                                  'assets/images/back.jpg',
                                  width: 30,
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
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              AvailableColors[index],
                              width: 30,
                            )
                        ),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                            child: Image.asset(
                              'assets/images/front.jpg',
                              width: 30,
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
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Text(
                          'Background:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Padding(padding: EdgeInsets.only(left: 17)),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                            child: Image.asset(
                              'assets/images/back.jpg',
                              width: 30,
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
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              AvailableBackgrounds[indexbg],
                              width: 30,
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
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text(
                          'Show results:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                       TextButton(
                          onPressed: () => {
                          },
                          child: Image.asset(
                            'assets/images/showresult.jpg',
                            width: 70,
                          ),
                      )
                      ],
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () => {
                            Navigator.of(context).pop()
                          },
                          child: Image.asset(
                            'assets/images/close.jpg',
                            width: 60,
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

// QuitMenu (BuildContext context) {
//   showDialog(
    
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       AlertDialog(
//         shape: RoundedRectangleBorder(
//             side: BorderSide(color: Colors.blue, width: 5.0),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       content: Container(
//         height: 200,
//         child: Column(
//           children: [
//             TextButton(
//               onPressed: () => {
//               },
//               child: Image.asset(
//                 'assets/images/quitmessage.jpg',
//                 width: 30,
//               ),
//             )
//           ]
//         ),
//           // child: TextButton(
//           //     onPressed: () => {
//           //       Navigator.of(context).pop()
//           //     },
//           //     child: Image.asset(
//           //       'assets/images/helpText.jpg',
//           //       width: 300,
//           //     ),
//           // ),
//       )
//       );
//     }
//   );
// }

dynamicHelp1 (BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.bottomCenter, // Set the alignment to bottom center
        child: Container(
          // widthFactor: 0.8, // Set the width factor to 80% of the screen width
          child: AlertDialog(
            content: TextButton(
                onPressed: () => {
                },
                child: Text(
                  "Are you sure you want to quit?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                  ),
                ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Image.asset(
                          'assets/images/yes.jpg',
                          width: 50,
                        ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'assets/images/no.jpg',
                        width: 50,
                      ),
                    ),
                  ),
                ],
              )
            ],
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
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDebleu[Random().nextInt(winningvideoUrlsTapiMarronDebleu.length)]
                  : loosingvideoUrlsTapiMarronDebleu[Random().nextInt(loosingvideoUrlsTapiMarronDebleu.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDebleu[Random().nextInt(winningvideoUrlsTapiMarronDebleu.length)]
                  : loosingvideoUrlsTapiMarronDebleu[Random().nextInt(loosingvideoUrlsTapiMarronDebleu.length)]
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
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDevert[Random().nextInt(winningvideoUrlsTapiMarronDevert.length)]
                  : loosingvideoUrlsTapiMarronDevert[Random().nextInt(loosingvideoUrlsTapiMarronDevert.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDevert[Random().nextInt(winningvideoUrlsTapiMarronDevert.length)]
                  : loosingvideoUrlsTapiMarronDevert[Random().nextInt(loosingvideoUrlsTapiMarronDevert.length)]
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
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDerouge[Random().nextInt(winningvideoUrlsTapiMarronDerouge.length)]
                  : loosingvideoUrlsTapiMarronDerouge[Random().nextInt(loosingvideoUrlsTapiMarronDerouge.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDerouge[Random().nextInt(winningvideoUrlsTapiMarronDerouge.length)]
                  : loosingvideoUrlsTapiMarronDerouge[Random().nextInt(loosingvideoUrlsTapiMarronDerouge.length)]
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
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDeblanc[Random().nextInt(winningvideoUrlsTapiMarronDeblanc.length)]
                  : loosingvideoUrlsTapiMarronDeblanc[Random().nextInt(loosingvideoUrlsTapiMarronDeblanc.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDeblanc[Random().nextInt(winningvideoUrlsTapiMarronDeblanc.length)]
                  : loosingvideoUrlsTapiMarronDeblanc[Random().nextInt(loosingvideoUrlsTapiMarronDeblanc.length)]
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
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDenoir[Random().nextInt(winningvideoUrlsTapiMarronDenoir.length)]
                  : loosingvideoUrlsTapiMarronDenoir[Random().nextInt(loosingvideoUrlsTapiMarronDenoir.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDenoir[Random().nextInt(winningvideoUrlsTapiMarronDenoir.length)]
                  : loosingvideoUrlsTapiMarronDenoir[Random().nextInt(loosingvideoUrlsTapiMarronDenoir.length)]
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
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDejaune[Random().nextInt(winningvideoUrlsTapiMarronDejaune.length)]
                  : loosingvideoUrlsTapiMarronDejaune[Random().nextInt(loosingvideoUrlsTapiMarronDejaune.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDejaune[Random().nextInt(winningvideoUrlsTapiMarronDejaune.length)]
                  : loosingvideoUrlsTapiMarronDejaune[Random().nextInt(loosingvideoUrlsTapiMarronDejaune.length)]
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
            },
            child: Stack(
              children: [
                VideoPlayer(_controller),
                  Positioned(
                    // top: 0,
                    // right: 0,
                    left: 125,
                    bottom: 40,
                    width: 40,
                    child: GestureDetector(
                      child: Image.asset('assets/images/quit.jpg'),
                      onTap: (){
                        dynamicHelp1(context);
                      }
                    ),
                  ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 185,
                    bottom: 40,
                    width: 40,
                    child: GestureDetector(
                    child: Image.asset('assets/images/help.jpg'),
                    onTap: (){
                      setState(() {
                        showHelp = true;
                      });
                    }
                  ),
                ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 245,
                    bottom: 40,
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
                    bottom: 40,
                    width: 40,
                    child: GestureDetector(
                      child: Image.asset('assets/images/settings.jpg'),
                      onTap: (){
                      print("setting pressed");
                      dynamic(context);
                    }
                  ),
                ),
                showHelp == true 
                ?Positioned(
                      // top: 0,
                      // right: 1,
                      left: 1,
                      bottom: 5,
                      // width: 300,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/images/helpText2.jpg',
                          width: MediaQuery.of(context).size.width,
                        ),
                        onTap: (){
                          setState(() {
                            showHelp = false;
                          });
                      }
                    ),
                  ): Text(""),
              ],
            )
            // child: AspectRatio(
            //   aspectRatio: _controller.value.aspectRatio,
            //   child: VideoPlayer(_controller),
            // ),
          )
        : Stack(
              children: [
                VideoPlayer(_controller),
                  Positioned(
                    // top: 0,
                    // right: 0,
                    left: 125,
                    bottom: 40,
                    width: 40,
                    child: GestureDetector(
                      child: Image.asset('assets/images/quit.jpg'),
                      onTap: (){
                        dynamicHelp1(context);
                      }
                    ),
                  ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 185,
                    bottom: 40,
                    width: 40,
                    child: GestureDetector(
                    child: Image.asset('assets/images/help.jpg'),
                    onTap: (){
                      setState(() {
                        showHelp = true;
                      });
                    }
                  ),
                ),
                Positioned(
                    // top: 0,
                    // right: 0,
                    left: 245,
                    bottom: 40,
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
                    bottom: 40,
                    width: 40,
                    child: GestureDetector(
                      child: Image.asset('assets/images/settings.jpg'),
                      onTap: (){
                      print("setting pressed");
                      dynamic(context);
                    }
                  ),
                ),
                showHelp == true 
                ?Positioned(
                      // top: 0,
                      // right: 1,
                      left: 1,
                      bottom: 5,
                      // width: 300,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/images/helpText2.jpg',
                          width: MediaQuery.of(context).size.width,
                        ),
                        onTap: (){
                          setState(() {
                            showHelp = false;
                          });
                      }
                    ),
                  ): Text(""),
              ],
            );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
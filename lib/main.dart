import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

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
  late FlutterFFmpeg _flutterFFmpeg;
  late int nombreDeFoisEstApparu2;
  late int nombreDeFoisEstApparu3;
  late int nombreDeFoisEstApparu4;
  late int nombreDeFoisEstApparu5;
  late int nombreDeFoisEstApparu6;
  late int nombreDeFoisEstApparu7;
  late int nombreDeFoisEstApparu8;
  late int nombreDeFoisEstApparu9;
  late int nombreDeFoisEstApparu10;
  late int nombreDeFoisEstApparu11;
  late int nombreDeFoisEstApparu12;
  late int huitNumero;
  late int neufNumero;
  late int dixNumero;
  late int quatreNumero;
  late int cinqNumero;
  late int sixNumero;
  late int septNumero;
  
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
    // 'assets/images/backgroundblanc2.jpg',
    // 'assets/images/backgroundmarron2.jpg',
    // 'assets/images/backgroundblancraille.jpg',
  ];

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

  List<String> winningvideoUrlsTapiBlancDebleu = [
    'assets/videos/Somme4_tapi_blanc_debleu.mp4',
    'assets/videos/Somme6_tapi_blanc_debleu.mp4',
    'assets/videos/Somme7_tapi_blanc_debleu.mp4',
    'assets/videos/Somme3_tapi_blanc_debleu.mp4',
    'assets/videos/Somme5_tapi_blanc_debleu.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDebleu= [
    'assets/videos/Somme2_tapi_blanc_debleu.mp4',
    'assets/videos/Somme8_tapi_blanc_debleu.mp4',
    'assets/videos/Somme9_tapi_blanc_debleu.mp4',
    'assets/videos/Somme11_tapi_blanc_debleu.mp4',
    'assets/videos/Somme10_tapi_blanc_debleu.mp4',
    'assets/videos/Somme12_tapi_blanc_debleu.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDevert = [
    'assets/videos/Somme4_tapi_blanc_devert.mp4',
    'assets/videos/Somme6_tapi_blanc_devert.mp4',
    'assets/videos/Somme7_tapi_blanc_devert.mp4',
    'assets/videos/Somme3_tapi_blanc_devert.mp4',
    'assets/videos/Somme5_tapi_blanc_devert.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDevert = [
    'assets/videos/Somme2_tapi_blanc_devert.mp4',
    'assets/videos/Somme8_tapi_blanc_devert.mp4',
    'assets/videos/Somme9_tapi_blanc_devert.mp4',
    'assets/videos/Somme11_tapi_blanc_devert.mp4',
    'assets/videos/Somme10_tapi_blanc_devert.mp4',
    'assets/videos/Somme12_tapi_blanc_devert.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDerouge= [
    'assets/videos/Somme4_tapi_blanc_derouge.mp4',
    'assets/videos/Somme6_tapi_blanc_derouge.mp4',
    'assets/videos/Somme7_tapi_blanc_derouge.mp4',
    'assets/videos/Somme3_tapi_blanc_derouge.mp4',
    'assets/videos/Somme5_tapi_blanc_derouge.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDerouge = [
    'assets/videos/Somme2_tapi_blanc_derouge.mp4',
    'assets/videos/Somme8_tapi_blanc_derouge.mp4',
    'assets/videos/Somme9_tapi_blanc_derouge.mp4',
    'assets/videos/Somme11_tapi_blanc_derouge.mp4',
    'assets/videos/Somme10_tapi_blanc_derouge.mp4',
    'assets/videos/Somme12_tapi_blanc_derouge.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDeblanc= [
    'assets/videos/Somme4_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme6_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme7_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme3_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme5_tapi_blanc_deblanc.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDeblanc = [
    'assets/videos/Somme2_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme8_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme9_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme11_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme10_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme12_tapi_blanc_deblanc.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDenoir= [
    'assets/videos/Somme4_tapi_blanc_denoir.mp4',
    'assets/videos/Somme6_tapi_blanc_denoir.mp4',
    'assets/videos/Somme7_tapi_blanc_denoir.mp4',
    'assets/videos/Somme3_tapi_blanc_denoir.mp4',
    'assets/videos/Somme5_tapi_blanc_denoir.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDenoir = [
    'assets/videos/Somme2_tapi_blanc_denoir.mp4',
    'assets/videos/Somme8_tapi_blanc_denoir.mp4',
    'assets/videos/Somme9_tapi_blanc_denoir.mp4',
    'assets/videos/Somme11_tapi_blanc_denoir.mp4',
    'assets/videos/Somme10_tapi_blanc_denoir.mp4',
    'assets/videos/Somme12_tapi_blanc_denoir.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDejaune= [
    'assets/videos/Somme4_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme6_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme7_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme3_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme5_tapi_blanc_dejaune.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDejaune= [
    'assets/videos/Somme2_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme8_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme9_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme11_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme10_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme12_tapi_blanc_dejaune.mp4'
  ];


  List<String> winningvideoUrlsGazonDevertCopy = [
    'assets/videos/Somme4_gazon_devert.mp4',
    'assets/videos/Somme6_gazon_devert.mp4',
    'assets/videos/Somme7_gazon_devert.mp4',
    'assets/videos/Somme3_gazon_devert.mp4',
    'assets/videos/Somme5_gazon_devert.mp4'
  ];

  List<String> loosingvideoUrlsGazonDevertCopy = [
    'assets/videos/Somme2_gazon_devert.mp4',
    'assets/videos/Somme8_gazon_devert.mp4',
    'assets/videos/Somme9_gazon_devert.mp4',
    'assets/videos/Somme11_gazon_devert.mp4',
    'assets/videos/Somme10_gazon_devert.mp4',
    'assets/videos/Somme12_gazon_devert.mp4'
  ];

  List<String> winningvideoUrlsGazonDebleuCopy = [
    'assets/videos/Somme4_gazon_debleu.mp4',
    'assets/videos/Somme6_gazon_debleu.mp4',
    'assets/videos/Somme7_gazon_debleu.mp4',
    'assets/videos/Somme3_gazon_debleu.mp4',
    'assets/videos/Somme5_gazon_debleu.mp4'
  ];

  List<String> loosingvideoUrlsGazonDebleuCopy = [
    'assets/videos/Somme2_gazon_debleu.mp4',
    'assets/videos/Somme8_gazon_debleu.mp4',
    'assets/videos/Somme9_gazon_debleu.mp4',
    'assets/videos/Somme11_gazon_debleu.mp4',
    'assets/videos/Somme10_gazon_debleu.mp4',
    'assets/videos/Somme12_gazon_debleu.mp4'
  ];

  List<String> winningvideoUrlsGazonDerougeCopy = [
    'assets/videos/Somme4_gazon_derouge.mp4',
    'assets/videos/Somme6_gazon_derouge.mp4',
    'assets/videos/Somme7_gazon_derouge.mp4',
    'assets/videos/Somme3_gazon_derouge.mp4',
    'assets/videos/Somme5_gazon_derouge.mp4'
  ];

  List<String> loosingvideoUrlsGazonDerougeCopy = [
    'assets/videos/Somme2_gazon_derouge.mp4',
    'assets/videos/Somme8_gazon_derouge.mp4',
    'assets/videos/Somme9_gazon_derouge.mp4',
    'assets/videos/Somme11_gazon_derouge.mp4',
    'assets/videos/Somme10_gazon_derouge.mp4',
    'assets/videos/Somme12_gazon_derouge.mp4'
  ];

  List<String> winningvideoUrlsGazonDeblancCopy = [
    'assets/videos/Somme4_gazon_deblanc.mp4',
    'assets/videos/Somme6_gazon_deblanc.mp4',
    'assets/videos/Somme7_gazon_deblanc.mp4',
    'assets/videos/Somme3_gazon_deblanc.mp4',
    'assets/videos/Somme5_gazon_deblanc.mp4'
  ];

  List<String> loosingvideoUrlsGazonDeblancCopy = [
    'assets/videos/Somme2_gazon_deblanc.mp4',
    'assets/videos/Somme8_gazon_deblanc.mp4',
    'assets/videos/Somme9_gazon_deblanc.mp4',
    'assets/videos/Somme11_gazon_deblanc.mp4',
    'assets/videos/Somme10_gazon_deblanc.mp4',
    'assets/videos/Somme12_gazon_deblanc.mp4'
  ];

  List<String> winningvideoUrlsGazonDenoirCopy = [
    'assets/videos/Somme4_gazon_denoir.mp4',
    'assets/videos/Somme6_gazon_denoir.mp4',
    'assets/videos/Somme7_gazon_denoir.mp4',
    'assets/videos/Somme3_gazon_denoir.mp4',
    'assets/videos/Somme5_gazon_denoir.mp4'
  ];

  List<String> loosingvideoUrlsGazonDenoirCopy = [
    'assets/videos/Somme2_gazon_denoir.mp4',
    'assets/videos/Somme8_gazon_denoir.mp4',
    'assets/videos/Somme9_gazon_denoir.mp4',
    'assets/videos/Somme11_gazon_denoir.mp4',
    'assets/videos/Somme10_gazon_denoir.mp4',
    'assets/videos/Somme12_gazon_denoir.mp4'
  ];

  List<String> winningvideoUrlsGazonDejauneCopy = [
    'assets/videos/Somme4_gazon_dejaune.mp4',
    'assets/videos/Somme6_gazon_dejaune.mp4',
    'assets/videos/Somme7_gazon_dejaune.mp4',
    'assets/videos/Somme3_gazon_dejaune.mp4',
    'assets/videos/Somme5_gazon_dejaune.mp4'
  ];

  List<String> loosingvideoUrlsGazonDejauneCopy = [
    'assets/videos/Somme2_gazon_dejaune.mp4',
    'assets/videos/Somme8_gazon_dejaune.mp4',
    'assets/videos/Somme9_gazon_dejaune.mp4',
    'assets/videos/Somme11_gazon_dejaune.mp4',
    'assets/videos/Somme10_gazon_dejaune.mp4',
    'assets/videos/Somme12_gazon_dejaune.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDebleuCopy = [
    'assets/videos/Somme4_tapi_marron_debleu.mp4',
    'assets/videos/Somme6_tapi_marron_debleu.mp4',
    'assets/videos/Somme7_tapi_marron_debleu.mp4',
    'assets/videos/Somme3_tapi_marron_debleu.mp4',
    'assets/videos/Somme5_tapi_marron_debleu.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDebleuCopy = [
    'assets/videos/Somme2_tapi_marron_debleu.mp4',
    'assets/videos/Somme8_tapi_marron_debleu.mp4',
    'assets/videos/Somme9_tapi_marron_debleu.mp4',
    'assets/videos/Somme11_tapi_marron_debleu.mp4',
    'assets/videos/Somme10_tapi_marron_debleu.mp4',
    'assets/videos/Somme12_tapi_marron_debleu.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDevertCopy = [
    'assets/videos/Somme4_tapi_marron_devert.mp4',
    'assets/videos/Somme6_tapi_marron_devert.mp4',
    'assets/videos/Somme7_tapi_marron_devert.mp4',
    'assets/videos/Somme3_tapi_marron_devert.mp4',
    'assets/videos/Somme5_tapi_marron_devert.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDevertCopy = [
    'assets/videos/Somme2_tapi_marron_devert.mp4',
    'assets/videos/Somme8_tapi_marron_devert.mp4',
    'assets/videos/Somme9_tapi_marron_devert.mp4',
    'assets/videos/Somme11_tapi_marron_devert.mp4',
    'assets/videos/Somme10_tapi_marron_devert.mp4',
    'assets/videos/Somme12_tapi_marron_devert.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDerougeCopy = [
    'assets/videos/Somme4_tapi_marron_derouge.mp4',
    'assets/videos/Somme6_tapi_marron_derouge.mp4',
    'assets/videos/Somme7_tapi_marron_derouge.mp4',
    'assets/videos/Somme3_tapi_marron_derouge.mp4',
    'assets/videos/Somme5_tapi_marron_derouge.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDerougeCopy = [
    'assets/videos/Somme2_tapi_marron_derouge.mp4',
    'assets/videos/Somme8_tapi_marron_derouge.mp4',
    'assets/videos/Somme9_tapi_marron_derouge.mp4',
    'assets/videos/Somme11_tapi_marron_derouge.mp4',
    'assets/videos/Somme10_tapi_marron_derouge.mp4',
    'assets/videos/Somme12_tapi_marron_derouge.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDeblancCopy = [
    'assets/videos/Somme4_tapi_marron_deblanc.mp4',
    'assets/videos/Somme6_tapi_marron_deblanc.mp4',
    'assets/videos/Somme7_tapi_marron_deblanc.mp4',
    'assets/videos/Somme3_tapi_marron_deblanc.mp4',
    'assets/videos/Somme5_tapi_marron_deblanc.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDeblancCopy = [
    'assets/videos/Somme2_tapi_marron_deblanc.mp4',
    'assets/videos/Somme8_tapi_marron_deblanc.mp4',
    'assets/videos/Somme9_tapi_marron_deblanc.mp4',
    'assets/videos/Somme11_tapi_marron_deblanc.mp4',
    'assets/videos/Somme10_tapi_marron_deblanc.mp4',
    'assets/videos/Somme12_tapi_marron_deblanc.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDenoirCopy = [
    'assets/videos/Somme4_tapi_marron_denoir.mp4',
    'assets/videos/Somme6_tapi_marron_denoir.mp4',
    'assets/videos/Somme7_tapi_marron_denoir.mp4',
    'assets/videos/Somme3_tapi_marron_denoir.mp4',
    'assets/videos/Somme5_tapi_marron_denoir.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDenoirCopy = [
    'assets/videos/Somme2_tapi_marron_denoir.mp4',
    'assets/videos/Somme8_tapi_marron_denoir.mp4',
    'assets/videos/Somme9_tapi_marron_denoir.mp4',
    'assets/videos/Somme11_tapi_marron_denoir.mp4',
    'assets/videos/Somme10_tapi_marron_denoir.mp4',
    'assets/videos/Somme12_tapi_marron_denoir.mp4'
  ];

  List<String> winningvideoUrlsTapiMarronDejauneCopy = [
    'assets/videos/Somme4_tapi_marron_dejaune.mp4',
    'assets/videos/Somme6_tapi_marron_dejaune.mp4',
    'assets/videos/Somme7_tapi_marron_dejaune.mp4',
    'assets/videos/Somme3_tapi_marron_dejaune.mp4',
    'assets/videos/Somme5_tapi_marron_dejaune.mp4'
  ];

  List<String> loosingvideoUrlsTapiMarronDejauneCopy = [
    'assets/videos/Somme2_tapi_marron_dejaune.mp4',
    'assets/videos/Somme8_tapi_marron_dejaune.mp4',
    'assets/videos/Somme9_tapi_marron_dejaune.mp4',
    'assets/videos/Somme11_tapi_marron_dejaune.mp4',
    'assets/videos/Somme10_tapi_marron_dejaune.mp4',
    'assets/videos/Somme12_tapi_marron_dejaune.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDebleuCopy = [
    'assets/videos/Somme4_tapi_blanc_debleu.mp4',
    'assets/videos/Somme6_tapi_blanc_debleu.mp4',
    'assets/videos/Somme7_tapi_blanc_debleu.mp4',
    'assets/videos/Somme3_tapi_blanc_debleu.mp4',
    'assets/videos/Somme5_tapi_blanc_debleu.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDebleuCopy = [
    'assets/videos/Somme2_tapi_blanc_debleu.mp4',
    'assets/videos/Somme8_tapi_blanc_debleu.mp4',
    'assets/videos/Somme9_tapi_blanc_debleu.mp4',
    'assets/videos/Somme11_tapi_blanc_debleu.mp4',
    'assets/videos/Somme10_tapi_blanc_debleu.mp4',
    'assets/videos/Somme12_tapi_blanc_debleu.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDevertCopy = [
    'assets/videos/Somme4_tapi_blanc_devert.mp4',
    'assets/videos/Somme6_tapi_blanc_devert.mp4',
    'assets/videos/Somme7_tapi_blanc_devert.mp4',
    'assets/videos/Somme3_tapi_blanc_devert.mp4',
    'assets/videos/Somme5_tapi_blanc_devert.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDevertCopy = [
    'assets/videos/Somme2_tapi_blanc_devert.mp4',
    'assets/videos/Somme8_tapi_blanc_devert.mp4',
    'assets/videos/Somme9_tapi_blanc_devert.mp4',
    'assets/videos/Somme11_tapi_blanc_devert.mp4',
    'assets/videos/Somme10_tapi_blanc_devert.mp4',
    'assets/videos/Somme12_tapi_blanc_devert.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDerougeCopy = [
    'assets/videos/Somme4_tapi_blanc_derouge.mp4',
    'assets/videos/Somme6_tapi_blanc_derouge.mp4',
    'assets/videos/Somme7_tapi_blanc_derouge.mp4',
    'assets/videos/Somme3_tapi_blanc_derouge.mp4',
    'assets/videos/Somme5_tapi_blanc_derouge.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDerougeCopy = [
    'assets/videos/Somme2_tapi_blanc_derouge.mp4',
    'assets/videos/Somme8_tapi_blanc_derouge.mp4',
    'assets/videos/Somme9_tapi_blanc_derouge.mp4',
    'assets/videos/Somme11_tapi_blanc_derouge.mp4',
    'assets/videos/Somme10_tapi_blanc_derouge.mp4',
    'assets/videos/Somme12_tapi_blanc_derouge.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDeblancCopy = [
    'assets/videos/Somme4_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme6_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme7_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme3_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme5_tapi_blanc_deblanc.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDeblancCopy = [
    'assets/videos/Somme2_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme8_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme9_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme11_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme10_tapi_blanc_deblanc.mp4',
    'assets/videos/Somme12_tapi_blanc_deblanc.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDenoirCopy = [
    'assets/videos/Somme4_tapi_blanc_denoir.mp4',
    'assets/videos/Somme6_tapi_blanc_denoir.mp4',
    'assets/videos/Somme7_tapi_blanc_denoir.mp4',
    'assets/videos/Somme3_tapi_blanc_denoir.mp4',
    'assets/videos/Somme5_tapi_blanc_denoir.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDenoirCopy = [
    'assets/videos/Somme2_tapi_blanc_denoir.mp4',
    'assets/videos/Somme8_tapi_blanc_denoir.mp4',
    'assets/videos/Somme9_tapi_blanc_denoir.mp4',
    'assets/videos/Somme11_tapi_blanc_denoir.mp4',
    'assets/videos/Somme10_tapi_blanc_denoir.mp4',
    'assets/videos/Somme12_tapi_blanc_denoir.mp4'
  ];

  List<String> winningvideoUrlsTapiBlancDejauneCopy = [
    'assets/videos/Somme4_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme6_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme7_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme3_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme5_tapi_blanc_dejaune.mp4'
  ];

  List<String> loosingvideoUrlsTapiBlancDejauneCopy = [
    'assets/videos/Somme2_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme8_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme9_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme11_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme10_tapi_blanc_dejaune.mp4',
    'assets/videos/Somme12_tapi_blanc_dejaune.mp4'
  ];

  @override
  void initState() {
    super.initState();
    final  customDate = "2023-12-30 00:00:00";
    final parsed = DateTime.parse(customDate);
    final maDate = DateTime.now();
    print("Result");
    print(maDate.isAfter(parsed));
    if (maDate.isAfter(parsed) == true){
      print("Exiting");
      exit(0);
    }
    tentativeCourrante = 2;
    icolor = 0;
    icolorbg = 0;
    showHelp = false;
    nombreDeFoisEstApparu2 = 0;
    nombreDeFoisEstApparu3 = 0;
    nombreDeFoisEstApparu4 = 0;
    nombreDeFoisEstApparu5 = 0;
    nombreDeFoisEstApparu6 = 0;
    nombreDeFoisEstApparu7 = 0;
    nombreDeFoisEstApparu8 = 0;
    nombreDeFoisEstApparu9 = 0;
    nombreDeFoisEstApparu10 = 0;
    nombreDeFoisEstApparu11 = 0;
    nombreDeFoisEstApparu12 = 0;
    huitNumero = 0;
    dixNumero = 0;
    neufNumero = 0;
    quatreNumero = 0;
    cinqNumero = 0;
    sixNumero = 0;
    septNumero = 0;
    // final prefs = await SharedPreferences.getInstance();

    _controller = VideoPlayerController.asset(winningvideoUrlsGazonDebleu[Random().nextInt(winningvideoUrlsGazonDebleu.length)]
    )..initialize().then((_) {
        setState(() {
          _controller.setVolume(0);
                    _controller.play();
          List<String> liste = _controller.dataSource.split("Somme");
          String somme = liste[1].split("_")[0];
          print("somme faite a l'initialisation");
          print(somme);
          if(somme == "8"){
            huitNumero += 1;
          }
          if(somme == "10"){
            dixNumero += 1;
          }
          if(somme == "9"){
            neufNumero += 1;
          }
          if(somme == "4"){
            quatreNumero += 1;
          }
          if(somme == "5"){
            cinqNumero += 1;
          }
          if(somme == "6"){
            sixNumero += 1;
          }
          if(somme == "7"){
            septNumero += 1;
          }
        });
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
      int diceCount = 2;
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
                                if (indexbg > 2){
                                  indexbg = 0;
                                }
                                print(indexbg);
                                icolorbg = indexbg;
                                _controllerInit.dispose();
                                if (icolorbg == 0){
                                  _controllerInit = VideoPlayerController.asset('assets/videos/initVert.mp4'
                                  );
                                }
                                if (icolorbg == 1){
                                  _controllerInit = VideoPlayerController.asset('assets/videos/initMarron.mp4'
                                  );
                                }
                                if (icolorbg == 2){
                                  _controllerInit = VideoPlayerController.asset('assets/videos/initBlanc.mp4'
                                  );
                                }
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
                                indexbg -= 1;
                                if (indexbg < 0){
                                  indexbg = 2;
                                }
                                print(indexbg);
                                icolorbg = indexbg;
                                _controllerInit.dispose();
                                if (icolorbg == 0){
                                  _controllerInit = VideoPlayerController.asset('assets/videos/initVert.mp4'
                                  );
                                }
                                if (icolorbg == 1){
                                  _controllerInit = VideoPlayerController.asset('assets/videos/initMarron.mp4'
                                  );
                                }
                                if (icolorbg == 2){
                                  _controllerInit = VideoPlayerController.asset('assets/videos/initBlanc.mp4'
                                  );
                                }
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
                            print(icolorbg),
                            Navigator.of(context).pop(),
                            // setState(() {
                            //   _controllerInit.initialize().then((value) {
                            //     setState(() {
                            //       // print("+++++++++++Numbre de lance");
                            //       // print(tentativeCourrante);
                            //     });
                            //   });
                            // })
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
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue, width: 5.0),
              borderRadius: BorderRadius.circular(10.0), // Set the border radius here
            ),
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
                          width: 60,
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
                        width: 60,
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
// Future<void> _mergeAudioAndVideo() async {
//     final audioPath = 'path/to/audio.mp3';
//     final videoPath = 'path/to/video.mp4';
//     final outputPath = 'path/to/output.mp4';

//     final arguments = '-i $videoPath -i $audioPath -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 $outputPath';

//     await _flutterFFmpeg.execute(arguments);

//     setState(() {
//       _controller = VideoPlayerController.file(File(outputPath));
//       _controller.play();
//     });
//   }
  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
          behavior: HitTestBehavior.opaque,
            onTap: () async {
              setState(() {
                if (tentativeCourrante > 22){
                  print("+++++++++Reinitialisation a 1");
                  tentativeCourrante = 1;
                  nombreDeFoisEstApparu4 = 0;
                  nombreDeFoisEstApparu5 = 0;
                  nombreDeFoisEstApparu9 = 0;
                  nombreDeFoisEstApparu10 = 0;
                  winningvideoUrlsGazonDevert = winningvideoUrlsGazonDevertCopy;
                  loosingvideoUrlsGazonDevert = loosingvideoUrlsGazonDevertCopy;
                  winningvideoUrlsGazonDebleu = winningvideoUrlsGazonDebleuCopy;
                  loosingvideoUrlsGazonDebleu = loosingvideoUrlsGazonDebleuCopy;
                  winningvideoUrlsGazonDerouge = winningvideoUrlsGazonDerougeCopy;
                  loosingvideoUrlsGazonDerouge = loosingvideoUrlsGazonDerougeCopy;
                  winningvideoUrlsGazonDeblanc = winningvideoUrlsGazonDeblancCopy;
                  loosingvideoUrlsGazonDeblanc = loosingvideoUrlsGazonDeblancCopy;
                  winningvideoUrlsGazonDenoir = winningvideoUrlsGazonDenoirCopy;
                  loosingvideoUrlsGazonDenoir = loosingvideoUrlsGazonDenoirCopy;
                  winningvideoUrlsGazonDejaune = winningvideoUrlsGazonDejauneCopy;
                  loosingvideoUrlsGazonDejaune = loosingvideoUrlsGazonDejauneCopy;
                  winningvideoUrlsTapiMarronDebleu = winningvideoUrlsTapiMarronDebleuCopy;
                  loosingvideoUrlsTapiMarronDebleu = loosingvideoUrlsTapiMarronDebleuCopy;
                  winningvideoUrlsTapiMarronDevert = winningvideoUrlsTapiMarronDevertCopy;
                  loosingvideoUrlsTapiMarronDevert = loosingvideoUrlsTapiMarronDevertCopy;
                  winningvideoUrlsTapiMarronDerouge = winningvideoUrlsTapiMarronDerougeCopy;
                  loosingvideoUrlsTapiMarronDerouge = loosingvideoUrlsTapiMarronDerougeCopy;
                  winningvideoUrlsTapiMarronDeblanc = winningvideoUrlsTapiMarronDeblancCopy;
                  loosingvideoUrlsTapiMarronDeblanc = loosingvideoUrlsTapiMarronDeblancCopy;
                  winningvideoUrlsTapiMarronDenoir = winningvideoUrlsTapiMarronDenoirCopy;
                  loosingvideoUrlsTapiMarronDenoir = loosingvideoUrlsTapiMarronDenoirCopy;
                  winningvideoUrlsTapiMarronDejaune = winningvideoUrlsTapiMarronDejauneCopy;
                  loosingvideoUrlsTapiMarronDejaune = loosingvideoUrlsTapiMarronDejauneCopy;
                  winningvideoUrlsTapiBlancDebleu = winningvideoUrlsTapiBlancDebleuCopy;
                  loosingvideoUrlsTapiBlancDebleu = loosingvideoUrlsTapiBlancDebleuCopy;
                  winningvideoUrlsTapiBlancDevert = winningvideoUrlsTapiBlancDevertCopy;
                  loosingvideoUrlsTapiBlancDevert = loosingvideoUrlsTapiBlancDevertCopy;
                  winningvideoUrlsTapiBlancDerouge = winningvideoUrlsTapiBlancDerougeCopy;
                  loosingvideoUrlsTapiBlancDerouge = loosingvideoUrlsTapiBlancDerougeCopy;
                  winningvideoUrlsTapiBlancDeblanc = winningvideoUrlsTapiBlancDeblancCopy;
                  loosingvideoUrlsTapiBlancDeblanc = loosingvideoUrlsTapiBlancDeblancCopy;
                  winningvideoUrlsTapiBlancDenoir = winningvideoUrlsTapiBlancDenoirCopy;
                  loosingvideoUrlsTapiBlancDenoir = loosingvideoUrlsTapiBlancDenoirCopy;
                  winningvideoUrlsTapiBlancDejaune = winningvideoUrlsTapiBlancDejauneCopy;
                  loosingvideoUrlsTapiBlancDejaune = loosingvideoUrlsTapiBlancDejauneCopy;
                }
              });
              if([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)){
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
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDebleu[Random().nextInt(winningvideoUrlsGazonDebleu.length)]
                  : loosingvideoUrlsGazonDebleu[Random().nextInt(loosingvideoUrlsGazonDebleu.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDebleu[Random().nextInt(winningvideoUrlsGazonDebleu.length)]
                  : loosingvideoUrlsGazonDebleu[Random().nextInt(loosingvideoUrlsGazonDebleu.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }else{
                          print("Quatre");
                          print(quatreNumero);
                          if (quatreNumero == 0){
                              setState(() {
                                winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                                winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                              });
                          }
                          setState(() {
                          if (quatreNumero > 1){
                              quatreNumero = 0;
                              winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                              winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            }else{
                              quatreNumero += 1;
                            }
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }else{
                          print("Cinq");
                          print(cinqNumero);
                          if (cinqNumero == 0){
                              setState(() {
                                winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                                winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                              });
                          }
                          setState(() {
                          if (cinqNumero > 1){
                              cinqNumero = 0;
                              winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                              winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            }else{
                              cinqNumero += 1;
                            }
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                        else{
                          print(neufNumero);
                          if (neufNumero == 0){
                              setState(() {
                                loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                                loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                              });
                          }
                          setState(() {
                            if (neufNumero > 1){
                                neufNumero = 0;
                                loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                                loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                              }
                            else{
                              neufNumero += 1;
                            }
                            });
                          }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }else{
                          print(dixNumero);
                          if (dixNumero == 0){
                              setState(() {
                                loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                                loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                              });
                          }
                          setState(() {
                            
                          if (dixNumero > 1){
                                dixNumero = 0;
                                loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                                loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                              }else{
                                dixNumero += 1;
                              }
                            });
                          }
                      });
                    }

                    if (somme == "8"){
                      print("----Numero");
                      print(huitNumero);
                      if (huitNumero == 0){
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          });
                      }

                      if (huitNumero == 1){
                        print("deuxieme tout pour 8");
                        setState(() {
                          loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_2.mp4");
                        });
                      }
                      setState(() {
                        
                        if (huitNumero > 2){
                          huitNumero = 0;
                          loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_2.mp4");
                          loosingvideoUrlsGazonDebleu.insert(loosingvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        }else{
                          huitNumero += 1;
                        }
                      });
                    }

                    if (somme == "6"){
                      print("Six");
                      print(sixNumero);
                      if (sixNumero == 0){
                          setState(() {
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          });
                      }

                      if (sixNumero == 1){
                        print("deuxieme tour pour 6");
                        setState(() {
                          winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_2.mp4");
                        });
                      }
                      setState(() {
                        
                        if (sixNumero > 2){
                          sixNumero = 0;
                          winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_2.mp4");
                          winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        }else{
                          sixNumero += 1;
                        }
                      });
                    }

                    if (somme == "7"){
                      print("Sept");
                      print("Numero");
                      if (septNumero == 0){
                          setState(() {
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                          });
                      }
                      setState(() {
                        if (septNumero > 1){
                            septNumero = 0;
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDebleu.insert(winningvideoUrlsGazonDebleu.length, "assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        }else{
                          septNumero += 1;
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    bool listenedForAudio = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }

                        // if (_controller.value.position <= _controller.value.duration * 0.1666666666666) {
                        // print(listenedForAudio);
                        // if (listenedForAudio == false){
                        //   print("--Lancement du Son");
                        //   // setState(() {
                        //     AudioPlayer player = AudioPlayer();
                        //     player.setAsset('assets/audios/rolling-dice.mp3');
                        //     player.play();
                        //   // });
                        //   listenedForAudio = true;
                        //   tentativeCourrante += 1;
                        //   }
                        // }else{
                        //   listenedForAudio = false;
                        // }
                    });
                  });
                }
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDebleu[Random().nextInt(winningvideoUrlsTapiMarronDebleu.length)]
                  : loosingvideoUrlsTapiMarronDebleu[Random().nextInt(loosingvideoUrlsTapiMarronDebleu.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDebleu[Random().nextInt(winningvideoUrlsTapiMarronDebleu.length)]
                  : loosingvideoUrlsTapiMarronDebleu[Random().nextInt(loosingvideoUrlsTapiMarronDebleu.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 2){
                  //  + Gazon blanc
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDebleu[Random().nextInt(winningvideoUrlsTapiBlancDebleu.length)]
                  : loosingvideoUrlsTapiBlancDebleu[Random().nextInt(loosingvideoUrlsTapiBlancDebleu.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDebleu[Random().nextInt(winningvideoUrlsTapiBlancDebleu.length)]
                  : loosingvideoUrlsTapiBlancDebleu[Random().nextInt(loosingvideoUrlsTapiBlancDebleu.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
              }



              if (icolor == 2){
                // De vert
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDevert[Random().nextInt(winningvideoUrlsGazonDevert.length)]
                  : loosingvideoUrlsGazonDevert[Random().nextInt(loosingvideoUrlsGazonDevert.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDevert[Random().nextInt(winningvideoUrlsGazonDevert.length)]
                  : loosingvideoUrlsGazonDevert[Random().nextInt(loosingvideoUrlsGazonDevert.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDevert[Random().nextInt(winningvideoUrlsTapiMarronDevert.length)]
                  : loosingvideoUrlsTapiMarronDevert[Random().nextInt(loosingvideoUrlsTapiMarronDevert.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDevert[Random().nextInt(winningvideoUrlsTapiMarronDevert.length)]
                  : loosingvideoUrlsTapiMarronDevert[Random().nextInt(loosingvideoUrlsTapiMarronDevert.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                
                if (icolorbg == 2){
                  //  + Gazon blanc
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDevert[Random().nextInt(winningvideoUrlsTapiBlancDevert.length)]
                  : loosingvideoUrlsTapiMarronDevert[Random().nextInt(loosingvideoUrlsTapiMarronDevert.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDevert[Random().nextInt(winningvideoUrlsTapiBlancDevert.length)]
                  : loosingvideoUrlsTapiBlancDevert[Random().nextInt(loosingvideoUrlsTapiBlancDevert.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
              }


              
              if (icolor == 1){
                // De rouge
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDerouge[Random().nextInt(winningvideoUrlsGazonDerouge.length)]
                  : loosingvideoUrlsGazonDerouge[Random().nextInt(loosingvideoUrlsGazonDerouge.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDerouge[Random().nextInt(winningvideoUrlsGazonDerouge.length)]
                  : loosingvideoUrlsGazonDerouge[Random().nextInt(loosingvideoUrlsGazonDerouge.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDerouge[Random().nextInt(winningvideoUrlsTapiMarronDerouge.length)]
                  : loosingvideoUrlsTapiMarronDerouge[Random().nextInt(loosingvideoUrlsTapiMarronDerouge.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDerouge[Random().nextInt(winningvideoUrlsTapiMarronDerouge.length)]
                  : loosingvideoUrlsTapiMarronDerouge[Random().nextInt(loosingvideoUrlsTapiMarronDerouge.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }

                if (icolorbg == 2){
                  //  + Gazon blanc
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDerouge[Random().nextInt(winningvideoUrlsTapiBlancDerouge.length)]
                  : loosingvideoUrlsTapiBlancDerouge[Random().nextInt(loosingvideoUrlsTapiBlancDerouge.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDerouge[Random().nextInt(winningvideoUrlsTapiBlancDerouge.length)]
                  : loosingvideoUrlsTapiBlancDerouge[Random().nextInt(loosingvideoUrlsTapiBlancDerouge.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
              }
              if (icolor == 4){
                // De blanc
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDeblanc[Random().nextInt(winningvideoUrlsGazonDeblanc.length)]
                  : loosingvideoUrlsGazonDeblanc[Random().nextInt(loosingvideoUrlsGazonDeblanc.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDeblanc[Random().nextInt(winningvideoUrlsGazonDeblanc.length)]
                  : loosingvideoUrlsGazonDeblanc[Random().nextInt(loosingvideoUrlsGazonDeblanc.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDebleu);
                    print(loosingvideoUrlsGazonDebleu);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDeblanc[Random().nextInt(winningvideoUrlsTapiMarronDeblanc.length)]
                  : loosingvideoUrlsTapiMarronDeblanc[Random().nextInt(loosingvideoUrlsTapiMarronDeblanc.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDeblanc[Random().nextInt(winningvideoUrlsTapiMarronDeblanc.length)]
                  : loosingvideoUrlsTapiMarronDeblanc[Random().nextInt(loosingvideoUrlsTapiMarronDeblanc.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsTapiMarronDeblanc);
                    print(loosingvideoUrlsTapiMarronDeblanc);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 2){
                  //  + Gazon blanc
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDeblanc[Random().nextInt(winningvideoUrlsTapiBlancDeblanc.length)]
                  : loosingvideoUrlsTapiBlancDeblanc[Random().nextInt(loosingvideoUrlsTapiBlancDeblanc.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDeblanc[Random().nextInt(winningvideoUrlsTapiBlancDeblanc.length)]
                  : loosingvideoUrlsTapiBlancDeblanc[Random().nextInt(loosingvideoUrlsTapiBlancDeblanc.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsTapiBlancDeblanc);
                    print(loosingvideoUrlsTapiBlancDeblanc);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
              }
              if (icolor == 3){
                // De noir
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDenoir[Random().nextInt(winningvideoUrlsGazonDenoir.length)]
                  : loosingvideoUrlsGazonDenoir[Random().nextInt(loosingvideoUrlsGazonDenoir.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDenoir[Random().nextInt(winningvideoUrlsGazonDenoir.length)]
                  : loosingvideoUrlsGazonDenoir[Random().nextInt(loosingvideoUrlsGazonDenoir.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDenoir);
                    print(loosingvideoUrlsGazonDenoir);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDenoir[Random().nextInt(winningvideoUrlsTapiMarronDenoir.length)]
                  : loosingvideoUrlsTapiMarronDenoir[Random().nextInt(loosingvideoUrlsTapiMarronDenoir.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDenoir[Random().nextInt(winningvideoUrlsTapiMarronDenoir.length)]
                  : loosingvideoUrlsTapiMarronDenoir[Random().nextInt(loosingvideoUrlsTapiMarronDenoir.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsTapiMarronDenoir);
                    print(loosingvideoUrlsTapiMarronDenoir);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }

                if (icolorbg == 2){
                  //  + Gazon blanc
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDenoir[Random().nextInt(winningvideoUrlsTapiBlancDenoir.length)]
                  : loosingvideoUrlsTapiBlancDenoir[Random().nextInt(loosingvideoUrlsTapiBlancDenoir.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDenoir[Random().nextInt(winningvideoUrlsTapiBlancDenoir.length)]
                  : loosingvideoUrlsTapiBlancDenoir[Random().nextInt(loosingvideoUrlsTapiBlancDenoir.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsTapiBlancDenoir);
                    print(loosingvideoUrlsTapiBlancDenoir);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
              }



              if (icolor == 5){
                // De jaune
                if (icolorbg == 0){
                  //  + Gazon vert
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDejaune[Random().nextInt(winningvideoUrlsGazonDejaune.length)]
                  : loosingvideoUrlsGazonDejaune[Random().nextInt(loosingvideoUrlsGazonDejaune.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsGazonDejaune[Random().nextInt(winningvideoUrlsGazonDejaune.length)]
                  : loosingvideoUrlsGazonDejaune[Random().nextInt(loosingvideoUrlsGazonDejaune.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsGazonDejaune);
                    print(loosingvideoUrlsGazonDejaune);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 1){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDejaune[Random().nextInt(winningvideoUrlsTapiMarronDejaune.length)]
                  : loosingvideoUrlsTapiMarronDejaune[Random().nextInt(loosingvideoUrlsTapiMarronDejaune.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiMarronDejaune[Random().nextInt(winningvideoUrlsTapiMarronDejaune.length)]
                  : loosingvideoUrlsTapiMarronDejaune[Random().nextInt(loosingvideoUrlsTapiMarronDejaune.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsTapiMarronDejaune);
                    print(loosingvideoUrlsTapiMarronDejaune);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
                  });
                }
                if (icolorbg == 2){
                  //  + Gazon marron
                    print([1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDejaune[Random().nextInt(winningvideoUrlsTapiBlancDejaune.length)]
                  : loosingvideoUrlsTapiBlancDejaune[Random().nextInt(loosingvideoUrlsTapiBlancDejaune.length)]);

                  _controller = VideoPlayerController.asset(
                  [1, 2, 4, 5, 7, 8, 12, 15, 18, 19, 20].contains(tentativeCourrante)
                  ? winningvideoUrlsTapiBlancDejaune[Random().nextInt(winningvideoUrlsTapiBlancDejaune.length)]
                  : loosingvideoUrlsTapiBlancDejaune[Random().nextInt(loosingvideoUrlsTapiBlancDejaune.length)]
                  )..initialize().then((_) {
                    setState(() {
                      print("+++++++++++Numbre de lance");
                      print(tentativeCourrante);
                    });
                    print(_controller.dataSource);
                    List<String> liste = _controller.dataSource.split("Somme");
                    String somme = liste[1].split("_")[0];
                    print("somme faite");
                    print(somme);
                    if (["2", "3", "11", "12"].contains(somme)){
                      setState(() {
                        winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                        winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                        winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                        winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                        winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                        winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                        winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                        winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                        winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                        winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                        winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                        winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                        winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                        winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                        winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                        winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                        winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                        winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                        loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                      });
                    }
                    if (somme == "4"){
                      setState(() {
                        nombreDeFoisEstApparu4 += 1;
                        if (nombreDeFoisEstApparu4 >= 2){
                          print("supression de la somme 4");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "5"){
                      setState(() {
                        nombreDeFoisEstApparu5 += 1;
                        if (nombreDeFoisEstApparu5 >= 2){
                          print("supression de la somme 5");
                          setState(() {
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "9"){
                      setState(() {
                        nombreDeFoisEstApparu9 += 1;
                        if (nombreDeFoisEstApparu9 >= 2){
                          print("supression de la somme 9");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }

                    if (somme == "10"){
                      setState(() {
                        nombreDeFoisEstApparu10 += 1;
                        if (nombreDeFoisEstApparu10 >= 2){
                          print("supression de la somme 10");
                          setState(() {
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu_1.mp4");
                            winningvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            loosingvideoUrlsGazonDevert.remove("assets/videos/Somme"+somme+"_gazon_devert.mp4");
                            winningvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            loosingvideoUrlsGazonDebleu.remove("assets/videos/Somme"+somme+"_gazon_debleu.mp4");
                            winningvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            loosingvideoUrlsGazonDerouge.remove("assets/videos/Somme"+somme+"_gazon_derouge.mp4");
                            winningvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            loosingvideoUrlsGazonDeblanc.remove("assets/videos/Somme"+somme+"_gazon_deblanc.mp4");
                            winningvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            loosingvideoUrlsGazonDenoir.remove("assets/videos/Somme"+somme+"_gazon_denoir.mp4");
                            winningvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            loosingvideoUrlsGazonDejaune.remove("assets/videos/Somme"+somme+"_gazon_dejaune.mp4");
                            winningvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            loosingvideoUrlsTapiMarronDebleu.remove("assets/videos/Somme"+somme+"_tapi_marron_debleu.mp4");
                            winningvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            loosingvideoUrlsTapiMarronDevert.remove("assets/videos/Somme"+somme+"_tapi_marron_devert.mp4");
                            winningvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            loosingvideoUrlsTapiMarronDerouge.remove("assets/videos/Somme"+somme+"_tapi_marron_derouge.mp4");
                            winningvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            loosingvideoUrlsTapiMarronDeblanc.remove("assets/videos/Somme"+somme+"_tapi_marron_deblanc.mp4");
                            winningvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            loosingvideoUrlsTapiMarronDenoir.remove("assets/videos/Somme"+somme+"_tapi_marron_denoir.mp4");
                            winningvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            loosingvideoUrlsTapiMarronDejaune.remove("assets/videos/Somme"+somme+"_tapi_marron_dejaune.mp4");
                            winningvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            loosingvideoUrlsTapiBlancDebleu.remove("assets/videos/Somme"+somme+"_tapi_blanc_debleu.mp4");
                            winningvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            loosingvideoUrlsTapiBlancDevert.remove("assets/videos/Somme"+somme+"_tapi_blanc_devert.mp4");
                            winningvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            loosingvideoUrlsTapiBlancDerouge.remove("assets/videos/Somme"+somme+"_tapi_blanc_derouge.mp4");
                            winningvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            loosingvideoUrlsTapiBlancDeblanc.remove("assets/videos/Somme"+somme+"_tapi_blanc_deblanc.mp4");
                            winningvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            loosingvideoUrlsTapiBlancDenoir.remove("assets/videos/Somme"+somme+"_tapi_blanc_denoir.mp4");
                            winningvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                            loosingvideoUrlsTapiBlancDejaune.remove("assets/videos/Somme"+somme+"_tapi_blanc_dejaune.mp4");
                          });
                        }
                      });
                    }
                    print("Maintenant");
                    print(winningvideoUrlsTapiBlancDejaune);
                    print(loosingvideoUrlsTapiBlancDejaune);
                    _controller.setVolume(0);
                    _controller.play();
                    bool listened = false;
                    _controller.addListener(() {
                        if (_controller.value.position >= _controller.value.duration * 0.33333333) {
                        print(listened);
                        if (listened == false){
                          print("-1--FIN---");
                          listened = true;
                          tentativeCourrante += 1;
                          }
                        }else{
                          listened = false;
                        }
                    });
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
                VideoPlayer(_controllerInit),
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
    _controller.removeListener(() {});
    _controller.dispose();
    _controllerInit.dispose();
    super.dispose();
  }
}
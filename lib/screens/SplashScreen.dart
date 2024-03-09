// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<List<Color>> AnimationColors = [
    [Color(0xFFFC9D45), Colors.brown],
    [Colors.white, Color.fromARGB(255, 255, 204, 185)],
  ];
  double index = 0;
  Timer? timer;
  startColorTransition() {
    setState(() {
      index++;
    });
    print(index);
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      startColorTransition();
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return IntroductionScreen();
      }));
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            height: double.infinity,
            width: double.infinity,
            duration: Duration(seconds: 2),
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: AnimationColors[index.toInt()])),
            child:
                // SvgPicture.asset(
                //   "assets/SVG/SplashScreenBG.svg",
                //   fit: BoxFit.contain,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 50.0),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child:
                AnimatedOpacity(
              opacity: index,
              duration: Duration(seconds: 2),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "WELCOME TO\nMONUMENTAL\nHABITS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

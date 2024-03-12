// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/screens.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int active = 0;

  final introTitle = [
    "WELCOME TO\nMONUMENTAL HABITS",
    "CREATE NEW\nHABITS EASILY",
    "KEEP TRACK OF YOUR\nPROGRESS EASILY",
    "JOIN A SUPPORTIVE\nCOMMUNITY"
  ];
  final TextStyle def = const TextStyle(
      color: Color.fromARGB(255, 86, 57, 47),
      fontSize: 20,
      fontWeight: FontWeight.bold);

  changeActive() {
    setState(() {
      active++;
    });
  }

  Widget introNav() {
    if (active < 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                loginNav();
              },
              child: Text("Skip", style: def)),
          SizedBox(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: introTitle.length,
              itemBuilder: (context, index) {
                bool isActive = false;
                if (index == active) {
                  isActive = true;
                }
                return CircleAvatar(
                  radius: isActive ? 7 : 5,
                  backgroundColor: isActive ? Colors.amber : Colors.black87,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 2,
                );
              },
            ),
          ),
          GestureDetector(
              onTap: () {
                changeActive();
              },
              child: Text(
                "Next",
                style: def,
              ))
        ],
      );
    } else {
      active = 0;
      return TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(300, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Color(0xFFFC9D45)),
          onPressed: () {},
          child: GestureDetector(
              onTap: () {
                loginNav();
              },
              child: Text("Get Started")));
    }
  }

  loginNav() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  introTitle[active],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 86, 57, 47),
                      fontSize: 30),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Image(
                    image: AssetImage("assets/Images/BG${active + 1}.png"),
                  )),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "WE CAN ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 86, 57, 47),
                          fontSize: 20),
                      children: [
                        TextSpan(
                            text: "HELP YOU",
                            style: TextStyle(color: Color(0xFFFC9D45))),
                        TextSpan(text: " TO BE A BETTER\nVERSION OF "),
                        TextSpan(
                            text: "YOURSELF",
                            style: TextStyle(color: Color(0xFFFC9D45))),
                      ]),
                ),
              ),
              introNav(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "WELCOME TO\nMONUMENTAL HABITS",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 86, 57, 47),
                fontSize: 30),
          ),
          Card_tile(title: 'Sign in with google', icon: 'googleIcon'),
          SizedBox(
            height: 20,
          ),
          Card_tile(
            title: 'Continue with Facebook',
            icon: 'faceBook',
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text("Log in with email"),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 10,
                ),
                Input_Card(
                    title: "Enter your mail", icon: Icons.inbox_outlined),
                SizedBox(
                  height: 10,
                ),
                Input_Card(
                    title: "Enter your password", icon: Icons.lock_outline),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Card_tile extends StatelessWidget {
  const Card_tile(
      {super.key,
      required this.title,
      required this.icon,
      this.textColor = Colors.black,
      this.bgColor = Colors.white});
  final String title;
  final String icon;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: bgColor,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
              ),
              SizedBox(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset("assets/SVG/$icon.svg")),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ));
  }
}

class Input_Card extends StatelessWidget {
  const Input_Card(
      {super.key,
      required this.title,
      required this.icon,
      this.textColor = Colors.black,
      this.bgColor = Colors.white});
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber.withOpacity(0.3)),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: title,
            border: InputBorder.none,
          ),
        ));
  }
}

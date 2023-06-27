// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
 SmallText({
    super.key, 
    required this.text, 
    this.color = Colors.black,
    this.size = 12,
    this.height = 1.2
  });
  final String text;
  final Color color;
  final double size;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: size,
        color: color,
        height: height
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/utils/diamentions.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final VoidCallback onPresse;
  const AppButton({
    super.key,
    required this.title,
    this.height = 45,
    this.width = double.maxFinite,
    required this.onPresse,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresse,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Diamentions.radius10),
            color: backgroundColor),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

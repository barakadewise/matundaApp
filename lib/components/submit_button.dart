import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  const Button({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 94, 37),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

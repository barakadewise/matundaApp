import 'package:flutter/material.dart';

class CustomSnackbar{
  final BuildContext context;
  final String erroMessage;
  final Color backgroundColor;
  
  CustomSnackbar({
    required this.context,
    required this.erroMessage,
    required this.backgroundColor

  });

void show(){
  final snackBar = SnackBar(
          showCloseIcon: true,
          elevation: 4,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          content:  Text(erroMessage));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

}
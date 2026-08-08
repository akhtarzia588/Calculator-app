import 'package:flutter/material.dart';
import 'package:calculator_app/Screen/home_screen.dart';

Widget button(String buttonText, Color buttonColor) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
  );
}

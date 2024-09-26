//function to handle the responvise height
import 'package:flutter/material.dart';
import 'package:test_app/res/colors.dart';

double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

//function to handle the responvise width
double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

//using custom snack bar
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: AppColors.startColor),
      ),
      backgroundColor: Colors.white,
    ),
  );
}

//using this function for responsive text
double getFontSize(double size, double screenWidth) {
  return size * screenWidth / 414;
}

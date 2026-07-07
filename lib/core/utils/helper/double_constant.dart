import 'package:flutter/material.dart';

double getScaleFactor(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double baseWidth = 425;
  return screenWidth / baseWidth;
}
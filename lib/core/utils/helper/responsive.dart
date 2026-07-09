import 'dart:math' as math;
import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
          MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1200;


  static double scale(BuildContext context, {
    required double min,
    required double max,
    double designWidth = 1440,
  }) {
    final width = MediaQuery.of(context).size.width;
    double value = max * (width/designWidth);
    return math.max(min, math.min(value, max));
  }
}

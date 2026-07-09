import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';

class AnimatedTitleSwitcherView extends StatefulWidget {
  const AnimatedTitleSwitcherView({super.key});

  @override
  State<AnimatedTitleSwitcherView> createState() => _AnimatedTitleSwitcherViewState();
}

class _AnimatedTitleSwitcherViewState extends State<AnimatedTitleSwitcherView> {
  final List<String> titles = [
    "iOS Developer",
    "Flutter Developer",
    "Mobile App Developer",
    "Swift & SwiftUI Engineer",
    "Software Developer",
  ];

  int titleIndex = 0;
  int charIndex = 0;

  String displayedText = "";
  bool showCursor = true;

  Timer? typingTimer;
  Timer? cursorTimer;
  Timer? holdTimer;

  @override
  void initState() {
    super.initState();

    _startCursorBlink();
    _startTyping();
  }

  void _startCursorBlink() {
    cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        showCursor = !showCursor;
      });
    });
  }

  void _startTyping() {
    typingTimer = Timer.periodic(const Duration(milliseconds: 120), (timer) {
      final currentText = titles[titleIndex];

      if (charIndex < currentText.length) {
        setState(() {
          displayedText += currentText[charIndex];
          charIndex++;
        });
      } else {
        typingTimer?.cancel();

        // hold before next word
        holdTimer = Timer(const Duration(seconds: 1), () {
          _startDeleting();
        });
      }
    });
  }

  void _startDeleting() {
    typingTimer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (displayedText.isNotEmpty) {
        setState(() {
          displayedText = displayedText.substring(0, displayedText.length - 1);
        });
      } else {
        typingTimer?.cancel();

        setState(() {
          titleIndex = (titleIndex + 1) % titles.length;
          charIndex = 0;
        });

        _startTyping();
      }
    });
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    cursorTimer?.cancel();
    holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$displayedText${showCursor ? "|" : ""}".toUpperCase(),
      style: GoogleFonts.lato(
        fontSize: Responsive.scale(context,
          min: 8,
          max: 22,
        ),
        // fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppColors.appWhiteColor,
        letterSpacing: 3,
      ),
    );
  }
}
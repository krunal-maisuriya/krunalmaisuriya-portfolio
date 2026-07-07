import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      color: AppColors.appBlackColor.withValues(alpha: 0.95),
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.lato(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.appWhiteColor,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "I am a Mobile Application Developer with 8+ years of experience in iOS development and cross-platform development using Flutter.",
            style: GoogleFonts.lato(
              fontSize: 15,
              color: AppColors.appWhiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

class SectionTitleView extends StatelessWidget {
  final String title;
  final Color? textColor;
  const SectionTitleView({super.key, required this.title, this.textColor = AppColors.appBlackColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 25, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
          const SizedBox(height: 2,),
          Container(
            width: 65, height: 3,
            decoration: BoxDecoration(
              color: AppColors.orangeColor.shade700,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}

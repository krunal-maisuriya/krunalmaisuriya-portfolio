import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';

class CopyRightSection extends StatelessWidget {
  const CopyRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: Color(0XFF121216),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(color: AppColors.cyanColor.withValues(alpha: 0.1)),
          const SizedBox(height: 25,),

          Center(
            child: Text(
              "© 2026 Krunal Maisuriya. All rights reserved.",
              style: GoogleFonts.lato(
                fontSize: Responsive.scale(context, min: 8, max: 14),
                color: AppColors.greyColor.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

class ProfileImageView extends StatelessWidget {
  final double width;
  final double height;
  const ProfileImageView({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(width/2),
        border: Border.all(color: AppColors.cyanColor.shade800.withValues(alpha: 0.8), width: 3.5),
        image: const DecorationImage(
          image: AssetImage("assets/krunal_maisuriya.jpeg"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 80,
            color: AppColors.cyanColor.withValues(alpha: 0.54),
          ),
        ],
      ),
    );
  }
}

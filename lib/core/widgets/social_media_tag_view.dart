import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

class SocialMediaTagView extends StatelessWidget {
  final IconData icons;
  const SocialMediaTagView({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightBlackColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyColor.shade400, width: 0.3)
      ),
      child: FaIcon(icons, color: AppColors.appWhiteColor, size: 20),
    );
  }
}

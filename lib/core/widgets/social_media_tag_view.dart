import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';

class SocialMediaTagView extends StatelessWidget {
  final IconData icons;
  const SocialMediaTagView({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(
        Responsive.isMobile(context)
            ? Responsive.scale(context, min: 2, max: 15)
            : 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightBlackColor,
        border: Border.all(color: AppColors.greyColor.shade400, width: 0.3),
        borderRadius: BorderRadius.circular(
          Responsive.scale(context, min: 5, max: 10),
        ),
      ),
      child: FaIcon(
        icons,
        color: AppColors.appWhiteColor,
        size: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 4, max: 25)
            : 18,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

class CvButtonView extends StatelessWidget {
  final double vertical;
  final double horizontal;
  final double borderRadius;
  final double iconSize;
  final double horizontalPaddingSize;
  final double fontSize;

  const CvButtonView({
    super.key,
    required this.vertical,
    required this.horizontal,
    required this.borderRadius,
    required this.iconSize,
    required this.horizontalPaddingSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColors.cyanColor.shade500, width: 1.0),
        color: AppColors.cyanColor.shade800.withValues(alpha: 0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.download_rounded,
            size: iconSize,
            color: AppColors.appWhiteColor,
          ),
          SizedBox(width: horizontalPaddingSize),

          AppLabelTextView(
            "CV",
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            textColor: AppColors.appWhiteColor,
          ),
        ],
      ),
    );
  }
}

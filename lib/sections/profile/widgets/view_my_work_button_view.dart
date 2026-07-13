import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

class ViewMyWorkButtonView extends StatelessWidget {
  final double vertical;
  final double horizontal;
  final double borderRadius;
  final double iconSize;
  final double horizontalPaddingSize;
  final double fontSize;
  final VoidCallback onTap;

  const ViewMyWorkButtonView({
    super.key,
    required this.vertical,
    required this.horizontal,
    required this.borderRadius,
    required this.iconSize,
    required this.horizontalPaddingSize,
    required this.fontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: AppColors.cyanColor.shade800, width: 1.0),
          color: AppColors.cyanColor.shade800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AppLabelTextView(
                "View My Work",
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
                textColor: AppColors.appWhiteColor,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            SizedBox(width: horizontalPaddingSize,),
            Icon(Icons.arrow_right_alt_sharp, color: AppColors.appWhiteColor,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}

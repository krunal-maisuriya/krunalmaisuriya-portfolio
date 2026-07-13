import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

class ProjectExperienceCountView extends StatelessWidget {
  final String title;
  final double titleFont;
  final int value;
  final double valueFont;

  const ProjectExperienceCountView({super.key,
    required this.title,
    required this.titleFont,
    required this.value,
    required this.valueFont,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: value),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return AppLabelTextView(
              "$value+",
              fontSize: valueFont,
              fontWeight: FontWeight.w900,
              textColor: AppColors.cyanColor.shade800,
              textAlign: TextAlign.center,
            );
          },
        ),

        AppLabelTextView(
          title,
          fontSize: titleFont,
          fontWeight: FontWeight.w400,
          textColor: AppColors.appWhiteColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

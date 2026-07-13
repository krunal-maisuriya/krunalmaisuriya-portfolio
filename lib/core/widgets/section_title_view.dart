import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

class SectionTitleView extends StatelessWidget {
  final String title;
  final Color textColor;
  const SectionTitleView({super.key, required this.title, this.textColor = AppColors.appBlackColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 25, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabelTextView(
            title.toUpperCase(),
            fontSize: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 13, max: 25)
                : Responsive.isTablet(context)
                  ? Responsive.scale(context, min: 18, max: 25) : 25,
            fontWeight: FontWeight.w800,
            textColor: textColor,
            letterSpacing: 3,
          ),

          const SizedBox(height: 2,),
          Container(
            width: Responsive.scale(context, min: 20, max: 65), height: 4.5,
            decoration: BoxDecoration(
              color: AppColors.cyanColor.shade800,
              borderRadius: BorderRadius.circular(Responsive.scale(context, min: 2, max: 15)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

class TagsView extends StatefulWidget {
  final String title;
  const TagsView({super.key, required this.title});

  @override
  State<TagsView> createState() => _TagsViewState();
}

class _TagsViewState extends State<TagsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.appWhiteColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(
          Responsive.isMobile(context) ? Responsive.scale(context, min: 6, max: 8) : 7,
        ),
        border: Border.all(color: AppColors.lightWhiteColor.withValues(alpha: 0.2), width: 0.4),
      ),
      child: AppLabelTextView(
        widget.title,
        fontSize: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 8, max: 18) : 12,
        fontWeight: FontWeight.w500,
        textColor: AppColors.lightWhiteColor.withValues(alpha: 0.5),
      ),
    );
  }
}

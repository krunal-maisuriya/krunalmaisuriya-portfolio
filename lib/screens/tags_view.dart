import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

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
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.lightWhiteColor.withValues(alpha: 0.7), width: 0.4),
      ),
      child: Text(
        widget.title,
        style: GoogleFonts.lato(
          color: AppColors.lightWhiteColor.withValues(alpha: 0.8),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

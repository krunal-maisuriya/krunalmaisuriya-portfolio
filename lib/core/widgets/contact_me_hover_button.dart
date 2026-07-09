import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';

class ContactMeHoverButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const ContactMeHoverButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<ContactMeHoverButton> createState() => _ContactMeHoverButtonState();
}

class _ContactMeHoverButtonState extends State<ContactMeHoverButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: isHovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.scale(context, min: 5, max: 25),
            vertical: Responsive.scale(context, min: 5, max: 15),
          ),
          decoration: BoxDecoration(
            color: isHovering
                ? AppColors.cyanColor.shade800
                : AppColors.cyanColor.shade700,
            borderRadius: BorderRadius.circular(Responsive.scale(context, min: 6, max: 11)),
            boxShadow: isHovering ? [
              BoxShadow(
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 5),
                color: Colors.black.withValues(alpha: 0.15),
              ),
            ] : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  "Connect Me",
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: Responsive.scale(context, min: 2.5, max: 15),
                    fontWeight: FontWeight.w800,
                    color: AppColors.appWhiteColor,
                  ),
                ),
              ),

              SizedBox(width: Responsive.scale(context, min: 2, max: 5),),
              Icon(
                Icons.arrow_right_alt_sharp,
                color: AppColors.appWhiteColor,
                size: Responsive.scale(context, min: 6, max: 23),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

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
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: isHovering
                ? AppColors.orangeColor.shade800
                : AppColors.orangeColor.shade700,
            borderRadius: BorderRadius.circular(12),
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
              Text(
                "Connect Me",
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.appWhiteColor,
                ),
              ),
              const SizedBox(width: 5,),
              Icon(Icons.arrow_right_alt_sharp, size: 25, color: AppColors.appWhiteColor,),
            ],
          ),
        ),
      ),
    );
  }
}
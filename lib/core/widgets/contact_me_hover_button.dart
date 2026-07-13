import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

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
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: MouseRegion(
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
              horizontal: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 5, max: 25) : 18,
              vertical: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 5, max: 15) : 12,
            ),
            decoration: BoxDecoration(
              color: isHovering
                  ? AppColors.cyanColor.shade800
                  : AppColors.cyanColor.shade700,
              borderRadius: BorderRadius.circular(Responsive.scale(context, min: 7, max: 11)),
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
                  child: AppLabelTextView(
                    "Connect Me",
                    fontSize: Responsive.isMobile(context)
                        ? Responsive.scale(context, min: 5, max: 15) : 14,
                    fontWeight: FontWeight.w800,
                    textColor: AppColors.appWhiteColor,
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
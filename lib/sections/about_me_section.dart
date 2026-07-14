import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Responsive.scale(context, min: 5, max: 40),
        right: Responsive.scale(context, min: 5, max: 40),
        bottom: 60,
      ),
      color: Color(0XFF121216),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 0 : 25,
            ),
            child: Divider(color: AppColors.cyanColor.withValues(alpha: 0.4),),
          ),

          // SECTION TITLE
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: AppLabelTextView(
              "About Me".toUpperCase(),
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 13, max: 25)
                  : Responsive.isTablet(context)
                  ? Responsive.scale(context, min: 18, max: 25) : 25,
              fontWeight: FontWeight.w800,
              textColor: AppColors.appWhiteColor,
              letterSpacing: 3,
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              spacing: 7,
              children: [
                AppLabelTextView(
                  "As a Senior iOS and Flutter App Developer based in Dubai with 8+ years of experience in designing, developing and deploying high-qualify native and cross-platform mobile applications. ",
                  fontSize: Responsive.isMobile(context)
                      ? Responsive.scale(context, min: 11, max: 20)
                      : 14.5,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
                  textAlign: TextAlign.center,
                ),
                AppLabelTextView(
                  "I specialize in building high-performance, scalable, and user-friendly mobile apps using Swift, SwiftUI, Flutter, Firebase and modern mobile architectures. With strong expertise in UI/UX implementation, API integrations, payment gateways, real-time communications, and performance optimization, I focus on creating seamless digital experiences that solve real-world problems. ",
                  fontSize: Responsive.isMobile(context)
                      ? Responsive.scale(context, min: 11, max: 20)
                      : 14.5,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
                ),
                AppLabelTextView(
                  "Throughout my career, I have successfully delivered mobile applications across various domains, including E-commerce, Real Estate, Sports, Utilities and Health & Fitness. I have published 13+ applications on the App Store and contributed to products that prioritize reliability, usability and exceptional user experiences. ",
                  fontSize: Responsive.isMobile(context)
                      ? Responsive.scale(context, min: 11, max: 20)
                      : 14.5,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
                ),
                AppLabelTextView(
                  "Passionate about clean architecture, innovative technologies, and continuous learning, I enjoy transforming ideas into impactful mobile solutions that combine great design with robust engineering. ",
                  fontSize: Responsive.isMobile(context)
                      ? Responsive.scale(context, min: 11, max: 20)
                      : 14.5,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/utils/helper/social_link_helper.dart';
import 'package:krunal_portfolio/core/widgets/animated_title_switcher_view.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
import 'package:krunal_portfolio/core/widgets/social_media_tag_view.dart';
import 'package:krunal_portfolio/sections/profile/widgets/cv_button_view.dart';
import 'package:krunal_portfolio/sections/profile/widgets/profile_image_view.dart';
import 'package:krunal_portfolio/sections/profile/widgets/project_experience_count_view.dart';
import 'package:krunal_portfolio/sections/profile/widgets/view_my_work_button_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSections extends StatelessWidget {
  final VoidCallback onTap;

  const HeroSections({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF121216),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth >= 820;
          bool isTablet = constraints.maxWidth >= 750 && constraints.maxWidth < 820;
          // bool isMobile = constraints.maxWidth < 750;

          return Padding(
            padding: EdgeInsets.only(
              left: Responsive.scale(context, min: 3, max: 40),
              right: Responsive.scale(context, min: 3, max: 40),
              top: isDesktop ? 150 : 120,
              bottom: isDesktop ? 120 : 40,
            ),
            child: isDesktop ? _buildDesktopLayout(context) 
                : isTablet ? _buildTabletLayout(context) 
                : _buildMobileLayout(context),
          );
        },
      ),
    );
  }


  //  DESKTOP VIEW
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // LEFT CONTENT
        Expanded(
          child: _textContent(context, textAlign: TextAlign.left),
        ),

        SizedBox(width: Responsive.scale(context, min: 10, max: 180)),

        // RIGHT IMAGE
        ProfileImageView(
          width: Responsive.scale(context, min: 250, max: 310),
          height: Responsive.scale(context, min: 250, max: 310),
        ),
        SizedBox(width: Responsive.scale(context, min: 10, max: 120)),
      ],
    );
  }


  //  Tablet View
  Widget _buildTabletLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // LEFT CONTENT
        Expanded(
          child: _textContent(context, textAlign: TextAlign.left),
        ),

        const SizedBox(width: 60),

        // RIGHT IMAGE
        ProfileImageView(width: 200, height: 200),
        const SizedBox(width: 30),
      ],
    );
  }

  //  MOBILE VIEW
  Widget _buildMobileLayout(BuildContext context,) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImageView(
          width: Responsive.scale(context, min: 150, max: 255),
          height: Responsive.scale(context, min: 150, max: 255),
        ),
        const SizedBox(height: 30),
        _textContent(context, textAlign: TextAlign.center),
      ],
    );
  }


  // ✍️ TEXT CONTENT
  Widget _textContent(BuildContext context, {required TextAlign textAlign}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: textAlign == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        AppLabelTextView(
          "Hi, I'm ",
          fontSize: Responsive.isMobile(context) 
              ? Responsive.scale(context, min: 10, max: 22) : 15,
          fontWeight: FontWeight.bold,
          textColor: AppColors.appWhiteColor.withValues(alpha: 0.7),
          textAlign: TextAlign.center,
        ),

        ///  User Name (KRUNAL)
        _shaderUserNameView(context),

        SizedBox(height: textAlign == TextAlign.left ? 5 : 10),

        ///  Changes Animated title
        const AnimatedTitleSwitcherView(),

        const SizedBox(height: 20),
        SizedBox(
          width: 650,
          child: Column(
            spacing: 7,
            children: [
              AppLabelTextView(
                "As a Senior iOS & Flutter App Developer based in Dubai with 8+ years of experience building high-quality native and cross-platform mobile applications. ",
                fontSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 11, max: 20)
                    : 14.5,
                fontWeight: FontWeight.w400,
                textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
              ),
              AppLabelTextView(
                "Specialized in Swift, SwiftUI, Flutter, Firebase, and modern mobile architectures, creating scalable, high-performance, and user-focused digital experiences. ",
                fontSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 11, max: 20)
                    : 14.5,
                fontWeight: FontWeight.w400,
                textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
              ),
              AppLabelTextView(
                  "Published 12+ apps on the App Store across E-commerce, Real Estate, Sports, Utilities, Business, and Health & Fitness domains.",
                fontSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 11, max: 20)
                    : 14.5,
                fontWeight: FontWeight.w400,
                textColor: AppColors.appWhiteColor.withValues(alpha: 0.65),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        /// CV & View my work buttons
        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          spacing: Responsive.scale(context, min: 3, max: 10),
          children: [
            //  CV
            CvButtonView(
              vertical: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 7, max: 12) : 12,
              horizontal: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 3, max: 20) : 20,
              borderRadius: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 7, max: 12) : 12,
              iconSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 3, max: 25) : 21,
              horizontalPaddingSize: Responsive.scale(context, min: 1, max: 8),
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 3, max: 17) : 14,
              onTap: () => downloadResume(),
            ),

            //  View My Work
            Flexible(
              child: ViewMyWorkButtonView(
                vertical: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 7, max: 15) : 12,
                horizontal: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 3, max: 20) : 20,
                borderRadius: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 7, max: 12) : 12,
                iconSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 3, max: 25) : 21,
                horizontalPaddingSize: Responsive.scale(context, min: 0, max: 5),
                fontSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 3, max: 17) : 14,
                onTap: () => onTap(),
              ),
            ),
          ],
        ),

        ///  Buttons (LinkedIn, Github, Email, Phone)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 10, max: 22) : 25,
          ),
          child: Row(
            mainAxisAlignment: textAlign == TextAlign.left
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            spacing: Responsive.scale(context, min: 2, max: 12),
            children: [

              //  LinkedIn
              GestureDetector(
                onTap: () => openLinkedIn(),
                child: SocialMediaTagView(icons: FontAwesomeIcons.linkedinIn,),
              ),

              //  Github
              GestureDetector(
                onTap: () => openGithub(),
                child: SocialMediaTagView(icons: FontAwesomeIcons.github,),
              ),

              //  Email
              GestureDetector(
                onTap: () => sendEmail(),
                child: SocialMediaTagView(icons: Icons.email_outlined,),
              ),

              //  Phone
              GestureDetector(
                onTap: () => callPhone(),
                child: SocialMediaTagView(icons: Icons.phone,),
              ),
            ],
          ),
        ),

        /// Experience and Done Projects view
        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            _experienceProjectView(context, value: 8, title: "YEAR OF EXPERIENCE"),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 0, max: 35)
                    : 35,
              ),
              child: Container(
                width: 1,
                height: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 5, max: 38)
                    : 38,
                decoration: BoxDecoration(
                  color: AppColors.lightWhiteColor.withValues(alpha: 0.2),
                ),
              ),
            ),

            _experienceProjectView(context, value: 16, title: "MAJOR PROJECTS"),
          ],
        ),
      ],
    );
  }

  //  Shader User Name
  Widget _shaderUserNameView(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.cyanAccent.shade200,
          Colors.blueAccent,
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: AppLabelTextView(
        "Krunal Maisuriya",
        fontSize: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 17, max: 42)
            : Responsive.isTablet(context)
            ? Responsive.scale(context, min: 28, max: 42)
            : 38,
        fontWeight: FontWeight.bold,
        textColor: AppColors.appWhiteColor,
        textAlign: TextAlign.center,
      ),
    );
  }


  //  Experience & Done Project View
  Widget _experienceProjectView(BuildContext context, {required int value, required String title}) {
    return Flexible(
      child: ProjectExperienceCountView(
        title: title,
        titleFont: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 0, max: 14)
            : 12,
        value: value,
        valueFont: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 8, max: 35)
            : 35,
      ),
    );
  }

  //  Download Resume
  Future<void> downloadResume() async {
    final url = Uri.parse("https://drive.google.com/file/d/1EPlNMAY4fA11I2fWseoKuIQ7YivfPlhG/view?usp=drive_link");

    if (!await launchUrl(url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not open resume');
    }
  }
}

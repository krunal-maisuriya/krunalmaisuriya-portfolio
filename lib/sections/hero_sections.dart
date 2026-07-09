import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/utils/helper/social_link_helper.dart';
import 'package:krunal_portfolio/core/widgets/animated_title_switcher_view.dart';
import 'package:krunal_portfolio/core/widgets/social_media_tag_view.dart';

class HeroSections extends StatelessWidget {
  const HeroSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF121216),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 990;

          return Padding(
            padding: EdgeInsets.only(
              left: Responsive.scale(context, min: 3, max: 40),
              right: Responsive.scale(context, min: 3, max: 40),
              top: isDesktop ? 150 : 120,
              bottom: isDesktop ? 120 : 40,
            ),
            child: isDesktop
                ? _buildDesktopLayout(context)
                : _buildMobileLayout(context),
          );
        },
      ),
    );
  }


  //  DESKTOP VIEW
  Widget _buildDesktopLayout(BuildContext context,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // LEFT CONTENT
        Expanded(child: _textContent(context, textAlign: TextAlign.left),),
        const SizedBox(width: 100),

        // RIGHT IMAGE
        _profileImage(textAlign: TextAlign.right),
        const SizedBox(width: 120),
      ],
    );
  }

  //  MOBILE VIEW
  Widget _buildMobileLayout(BuildContext context,) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _profileImage(textAlign: TextAlign.center),
        const SizedBox(height: 30),
        _textContent(
          context,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // 👤 PROFILE IMAGE
  Widget _profileImage({required TextAlign textAlign}) {
    return Container(
      width: textAlign == TextAlign.right ? 300 : 160,
      height: textAlign == TextAlign.right ? 300 : 160,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(160),
        border: Border.all(color: AppColors.cyanColor.shade800.withValues(alpha: 0.8), width: 3.5),
        image: const DecorationImage(
          image: AssetImage("assets/krunal_maisuriya.jpeg"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: AppColors.cyanColor.withValues(alpha: 0.34),
          ),
        ],
      ),
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
        Text(
          "Hi, I'm ",
          style: GoogleFonts.lato(
            fontSize: Responsive.scale(context,
              min: textAlign == TextAlign.left ? 15 : 10,
              max: textAlign == TextAlign.left ? 15 : 20,
            ),
            fontWeight: FontWeight.bold,
            color: AppColors.appWhiteColor.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),

        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Colors.cyanAccent.shade200,
              Colors.blueAccent,
            ],
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            "Krunal Maisuriya",
            style: GoogleFonts.lato(
              fontSize: Responsive.scale(context,
                min: textAlign == TextAlign.left ? 15 : 12,
                max: textAlign == TextAlign.left ? 50 : 38,
              ),
              // fontSize: textAlign == TextAlign.left ? 50 : 33,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: textAlign == TextAlign.left ? 5 : 10),

        const AnimatedTitleSwitcherView(),

        const SizedBox(height: 20),
        SizedBox(
          width: 650,
          child: Text(
            "As a Senior iOS and Flutter App Developer based in Dubai with 8+ years of experience in mobile application development. "
                "I specialize in building high-performance, scalable, and user-friendly mobile apps for both iOS and cross-platform environments. "
                "With a strong expertise in Swift, SwiftUI, Flutter and modern mobile architectures. "
                "Passionate about creating seamless user experiences and transforming ideas into innovative, high-impact digital products.",
            style: GoogleFonts.lato(
              fontSize: Responsive.scale(context, min: 8, max: textAlign == TextAlign.left ? 16 : 20),
              color: AppColors.appWhiteColor.withValues(alpha: 0.7),
            ),
          ),
        ),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          spacing: Responsive.scale(context, min: 3, max: 10),
          children: [
            //  CV
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.scale(context, min: 7, max: 8),
                horizontal: Responsive.scale(context, min: 3, max: 20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Responsive.scale(context, min: 7, max: 12)),
                border: Border.all(color: AppColors.cyanColor.shade500, width: 1.0),
                color: AppColors.cyanColor.shade800.withValues(alpha: 0.15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download_rounded,
                    size: textAlign == TextAlign.left
                        ? 25
                        : Responsive.scale(context, min: 3, max: 30),
                    color: AppColors.appWhiteColor,
                  ),
                  SizedBox(width: Responsive.scale(context, min: 1, max: 8),),
                  Text(
                    // "Download CV",
                    "CV",
                    style: GoogleFonts.lato(
                      fontSize: textAlign == TextAlign.left
                          ? 14
                          : Responsive.scale(context, min: 3, max: 20),
                      // fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ],
              ),
            ),

            //  View My Work
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Responsive.scale(context, min: 7, max: 12),
                  horizontal: Responsive.scale(context, min: 3, max: 20),
                ),
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Responsive.scale(context, min: 7, max: 12)),
                  border: Border.all(color: AppColors.cyanColor.shade800, width: 1.0),
                  color: AppColors.cyanColor.shade800,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        "View My Work",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: GoogleFonts.lato(
                          fontSize: textAlign == TextAlign.left
                              ? 14
                              : Responsive.scale(context, min: 3, max: 20),
                          // fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.appWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(width: Responsive.scale(context, min: 0, max: 5),),
                    Icon(Icons.arrow_right_alt_sharp, color: AppColors.appWhiteColor,
                      size: Responsive.scale(context, min: 3, max: 25),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Row(
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

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            _experienceProjectView(context, value: "8+", title: "YEAR OF EXPERIENCE"),
            SizedBox(width: Responsive.scale(context, min: 3, max: 35)),

            Container(
              width: 1,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.lightWhiteColor.withValues(alpha: 0.2),
              ),
            ),

            SizedBox(width: Responsive.scale(context, min: 3, max: 35)),
            _experienceProjectView(context, value: "13+", title: "MAJOR PROJECTS"),
          ],
        ),
      ],
    );
  }

  //  Experience & Done Project View
  Widget _experienceProjectView(BuildContext context, {required String value, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.lato(
            fontSize: Responsive.scale(context, min: 7, max: 35),
            fontWeight: FontWeight.w900,
            color: AppColors.cyanColor.shade800,
          ),
          textAlign: TextAlign.center,
        ),

        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: Responsive.scale(context, min: 1, max: 17),
            fontWeight: FontWeight.w400,
            color: AppColors.appWhiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

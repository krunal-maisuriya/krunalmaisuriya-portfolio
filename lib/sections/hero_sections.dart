import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/social_link_helper.dart';
import 'package:krunal_portfolio/core/widgets/animated_title_switcher_view.dart';
import 'package:krunal_portfolio/core/widgets/social_media_tag_view.dart';

class HeroSections extends StatelessWidget {
  const HeroSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBlackColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 990;

          return Padding(
            padding: EdgeInsets.only(
              left: 40, right: 40,
              top: isDesktop ? 150 : 120,
              bottom: isDesktop ? 120 : 40,
            ),
            child: isDesktop
                ? _buildDesktopLayout()
                : _buildMobileLayout(),
          );
        },
      ),
    );
  }


  //  DESKTOP VIEW
  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // LEFT CONTENT
        Expanded(child: _textContent(textAlign: TextAlign.left),),
        const SizedBox(width: 100),

        // RIGHT IMAGE
        _profileImage(textAlign: TextAlign.right),
        const SizedBox(width: 120),
      ],
    );
  }

  //  MOBILE VIEW
  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _profileImage(textAlign: TextAlign.center),
        const SizedBox(height: 30),
        _textContent(
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
        border: Border.all(color: AppColors.orangeColor.shade800.withValues(alpha: 0.8), width: 1.5),
        image: const DecorationImage(
          image: AssetImage("assets/krunal_maisuriya.jpeg"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: AppColors.orangeColor.withValues(alpha: 0.34),
          ),
        ],
      ),
    );
  }

  // ✍️ TEXT CONTENT
  Widget _textContent({required TextAlign textAlign}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: textAlign == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm ",
          style: GoogleFonts.lato(
            fontSize: textAlign == TextAlign.left ? 15 : 20,
            fontWeight: FontWeight.bold,
            color: AppColors.appWhiteColor.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),

        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Colors.orange,
              Colors.blueAccent,
            ],
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            "Krunal Maisuriya",
            style: GoogleFonts.lato(
              fontSize: textAlign == TextAlign.left ? 50 : 33,
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
              fontSize: 16,
              color: AppColors.appWhiteColor.withValues(alpha: 0.7),
            ),
          ),
        ),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          spacing: 10,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.orangeColor.shade900, width: 1.0),
                color: AppColors.orangeColor.shade800.withValues(alpha: 0.15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download_rounded, size: 25, color: AppColors.appWhiteColor,),
                  const SizedBox(width: 8,),
                  Text(
                    // "Download CV",
                    "CV",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.orangeColor.shade800, width: 1.0),
                color: AppColors.orangeColor.shade800,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View My Work",
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
          ],
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          spacing: 12,
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
            _experienceProjectView(value: "8+", title: "YEAR OF EXPERIENCE"),
            const SizedBox(width: 35),

            Container(
              width: 1,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.lightWhiteColor.withValues(alpha: 0.2),
              ),
            ),

            const SizedBox(width: 35),
            _experienceProjectView(value: "13+", title: "MAJOR PROJECTS"),
          ],
        ),
      ],
    );
  }

  //  Experience & Done Project View
  Widget _experienceProjectView({required String value, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.lato(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: AppColors.orangeColor.shade800,
          ),
          textAlign: TextAlign.center,
        ),

        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.appWhiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

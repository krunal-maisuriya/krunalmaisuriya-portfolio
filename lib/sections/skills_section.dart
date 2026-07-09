import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int hoverIndex = -1;
  final List<Map<String, dynamic>> skillsData = [
    {
      "title": "Mobile Development",
      "skills": ["iOS", "Swift", "SwiftUI", "Flutter", "Dart"]
    },
    {
      "title": "Architecture & Design Patterns",
      "skills": ["MVVM", "MVC", "Clean Architecture", "Combine"]
    },
    {
      "title": "Backend & APIs",
      "skills": ["Firebase Firestore", "URL Session", "RESTful APIs", "JSON Parsing"]
    },
    {
      "title": "Platforms & Tools",
      "skills": ["Xcode", "Android Studio", "GitHub", "SourceTree", "CocoaPods", "Dependencies", "Postman", "Figma", "Jira"]
    },
    {
      "title": "Frameworks & Libraries",
      "skills": ["Firebase", "Provider", "Riverpod", "Alamofire", "Kingfisher", "SDWebImage", "MapKit", "Google Maps"]
    },
    {
      "title": "Payments",
      "skills": ["Stripe", "Apple Pay", "In-App Purchases", "Subscriptions", "PayPal", "PayUmoney"]
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 70),
      // color: AppColors.appBlackColor,
      color: Color(0XFF121216),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
            child: Divider(color: AppColors.cyanColor.withValues(alpha: 0.1),),
          ),

          // SECTION TITLE
          const SizedBox(height: 30),
          SectionTitleView(title: "Skills & Technologies", textColor: AppColors.appWhiteColor,),
          const SizedBox(height: 10),

          // HORIZONTAL RESPONSIVE LAYOUT
          LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            int columns;

            if (width < 600) {
              columns = 1; // mobile
            } else if (width < 1000) {
              columns = 2; // tablet
            } else {
              columns = 3; // desktop
            }

            double itemWidth = (width - (columns - 1) * 20) / columns;

            return Wrap(
              spacing: 15,
              runSpacing: 15,
              children: skillsData.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> data = entry.value;

                return SizedBox(
                  width: itemWidth,
                  child: _skillsTechnologiesSectionView(
                    index: index,
                    title: data["title"],
                    skills: List<String>.from(data["skills"]),
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }

  //  Skills & Technologies section
  Widget _skillsTechnologiesSectionView({
    required int index,
    required String title,
    required List<String> skills,
  }) {
    final bool isHover = hoverIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => hoverIndex = index);
      },
      onExit: (_) {
        setState(() => hoverIndex = -1);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        constraints: const BoxConstraints(minHeight: 150),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 20),
        width: double.infinity,
        transform: isHover
            ? Matrix4.translationValues(0, -3, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isHover
              ? AppColors.cyanColor.shade700
              : AppColors.greyColor.shade900,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.cyanColor.shade400,
              ),
            ),
            const SizedBox(height: 25,),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: skills
                  .map((skill) => skillsView(title: skill))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }


  //  Skills
  Widget skillsView({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.appWhiteColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.lightWhiteColor.withValues(alpha: 0.7), width: 0.4),
      ),
      child: Text(
        title,
        style: GoogleFonts.lato(
          color: AppColors.lightWhiteColor.withValues(alpha: 0.8),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

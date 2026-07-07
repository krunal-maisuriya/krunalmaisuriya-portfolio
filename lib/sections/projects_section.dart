import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';
import 'package:krunal_portfolio/models/product_model.dart';
import 'package:krunal_portfolio/screens/tags_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int hoverIndex = -1;

  final List<ProjectModel> projectsData = [
    ProjectModel(
      appName: "Zap Solar",
      description: "",
      image: "",
      tags: ["Flutter", "Dart", "Firebase", "Charts", "Dio", "Riverpod"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "In Progress",
    ),
    ProjectModel(
      appName: "Zap Power App (Customer)",
      description: "Developed a modern application that customer check the subscription and purchase the subscription. Also Customer get the battery order delivery. "
          "",
      image: "",
      tags: ["Flutter", "Dart", "Firebase", "Charts", "Dio", "Riverpod", "GoogleMaps", "pdfviewer", "Stripe", "Apple Pay"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "In Progress",
    ),
    // Project(
    //   appName: "Zap Driver App",
    //   description: "Bio music is a mediation music app that helps to improve health, reduce stress and feel you relax.",
    //   image: "",
    //   tags: ["Flutter", "Firebase", "Maps"],
    //   iosAppLink: "https://apps.apple.com/us/app/firmpet-app/id1641636133",
    //   androidAppLink: "",
    //   githubLink: "",
    //   projectStatus: "Hold",
    // ),
    ProjectModel(
      appName: "FirmPet",
      description: "FirmPet is an advanced Health Monitoring App with curated features for pet health. "
          "Built a SwiftUI-based pet health monitoring application with Libre2 sensor integration, custom analytics charts, and multi-pet profile management. "
          "Implemented personalized data tracking and doctor assignment features to enhance pet healthcare management.",
      // description: "FirmPet is an advanced Health Monitoring App with curated features for pet health. "
      //     "A uniquely designed app dedicated to offering a better lifestyle to pets and pet's daily activities as per the logs maintained to avoid long-term health risks.",
      image: "",
      tags: ["SwiftUI", "MVVM", "Firebase", "Charts", "URLSession", "Encryption/Decryption", "Combine", "Hardware Sensor Activation", "Youtube Player"],
      iosAppLink: "https://apps.apple.com/us/app/firmpet-app/id1641636133",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Completed",
    ),
    ProjectModel(
      appName: "My Virtual Business Card",
      description: "MVBC is the best online business card offering an innovative platform to manage your professional business cards on your mobile phone. "
          "Client can scanned and stored traditional business cards in the app and share business card with colleagues. "
          "Implemented In-app purchase integration, a user-friendly chat system and sharing business card on social media.",
      image: "",
      tags: ["Swift", "MVVM", "Firebase", "Chatting", "In-app purchase", "Barcode Scanner"],
      iosAppLink: "https://apps.apple.com/us/app/my-virtual-business-card/id1544764504",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Completed",
    ),
    ProjectModel(
      appName: "ParkForU - Driver",
      description: "Designed and developed the driver-side application for an airport valet and transportation service, enabling drivers to efficiently manage pickup and drop-off operations. "
          "Implemented secure trip management, ride acceptance workflows, manage online/offline availability status and driver shift tracking. "
          "Focused on delivering a reliable and seamless experience for drivers while improving overall operational efficiency.",
      image: "",
      tags: ["Swift", "UIKit", "Firebase", "Alamofire", "MVC", "Rest API", "Push Notification", "Payment Integration"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Completed",
    ),
    ProjectModel(
      appName: "Score Ice - Hockey",
      description: "Developed and enhanced a hockey arena booking platform where arena managers create playing slots and users can discover and book available hockey sessions. "
          "Implemented advanced slot filtering, map-based slot discovery and resolved critical issues to improve performance and user experience.",
      image: "",
      tags: ["Swift", "UIKit", "MVVM", "Rest API", "Fastlane", "Firebase", "Stripe", "FSCalendar", "Google Maps"],
      iosAppLink: "https://apps.apple.com/us/app/score-ice/id1424884700",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Completed",
    ),
    ProjectModel(
      appName: "Bio Music One",
      description: "Bio music is a mediation music app that helps to improve health, reduce stress and feel you relax.",
      image: "",
      tags: ["Swift", "UIKit", "MVVM", "API", "Subscription", "audio player"],
      iosAppLink: "https://apps.apple.com/fr/app/bio-music-one/id1598573976",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Completed",
    ),
    ProjectModel(
      appName: "Shree Khalashi Timala Punch",
      description: "This app provides community details, upcoming news and events.",
      image: "",
      tags: ["Flutter", "Firebase", "Dio", "MVVM", "Push Notification"],
      iosAppLink: "",
      androidAppLink: "https://play.google.com/store/apps/details?id=com.varshaaweblabs.shreekhalashitimalapanchrander",
      githubLink: "",
      projectStatus: "Completed",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 50),
      color: AppColors.littleBlackColor,
      child: Column(
        children: [

          // SECTION TITLE
          SectionTitleView(title: "Projects", textColor: AppColors.appWhiteColor,),
          const SizedBox(height: 10),

          // HORIZONTAL RESPONSIVE LAYOUT
          LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            int columns;

            if (width <600) {
              columns = 1;
            } else if (width < 1000) {
              columns = 2; // tablet
            } else {
              columns = 3; // desktop
            }

            double itemWidth = (width - (columns - 1) * 30) / columns;

            return Padding(
              padding: EdgeInsets.only(left: 15,),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: projectsData.asMap().entries.map((entry) {
                  int index = entry.key;
                  ProjectModel data = entry.value;

                  return SizedBox(
                    width: itemWidth,
                    child: _projectsDataView(index: index, data: data),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }

  //  Projects Data section
  Widget _projectsDataView({required int index, required ProjectModel data}) {
    final bool isHover = hoverIndex == index;

    return MouseRegion(
      onEnter: (_) {
        setState(() => hoverIndex = index);
      },
      onExit: (_) {
        setState(() => hoverIndex = -1);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        constraints: const BoxConstraints(minHeight: 320),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 10),
        width: double.infinity,
        transform: isHover
            ? Matrix4.translationValues(0, -3, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isHover
                ? AppColors.orangeColor.shade700
                : AppColors.greyColor.shade800,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            Text(
              data.appName,
              style: GoogleFonts.lato(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.orangeColor.shade700,
              ),
            ),
            const SizedBox(height: 15,),

            Text(
              data.description,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.appWhiteColor.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 20,),

            //  Tags
            Wrap(
              spacing: 6, runSpacing: 6,
              children: data.tags.map((tag) => TagsView(title: tag)).toList(),
            ),

            const SizedBox(height: 25,),

            Row(
              spacing: 8,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: data.projectStatus == "Completed"
                        ? AppColors.darkGreenColor.withValues(alpha: 0.1)
                        : data.projectStatus == "In Progress"
                        ? AppColors.orangeColor.withValues(alpha: 0.1)
                        : AppColors.lightBlackColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 0.5,
                      color: data.projectStatus == "Completed"
                          ? AppColors.darkGreenColor
                          : data.projectStatus == "In Progress"
                          ? AppColors.orangeColor : AppColors.lightWhiteColor.withValues(alpha: 0.8),
                    ),
                  ),
                  child: Text(
                    data.projectStatus,
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.appWhiteColor.withValues(alpha: 0.7),
                    ),
                  ),
                ),

                Spacer(),

                if (data.githubLink.isNotEmpty)
                  GestureDetector(
                    onTap: () => openUrl(data.githubLink),
                    child: FaIcon(FontAwesomeIcons.github, color: AppColors.appWhiteColor,),
                  ),

                if (data.iosAppLink.isNotEmpty)
                  GestureDetector(
                    onTap: () => openUrl(data.iosAppLink),
                    child: Image.asset("assets/ic_appstore.jpeg", width: 22, height: 22,),
                  ),

                if (data.androidAppLink.isNotEmpty)
                  GestureDetector(
                    onTap: () => openUrl(data.androidAppLink),
                    child: Image.asset("assets/ic_playstore.jpeg", width: 20, height: 20,),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //  iOS & Android app Link
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    }
  }
}

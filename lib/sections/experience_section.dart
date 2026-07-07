import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});

  final List<String> zapPowerExperience = [
    "Research on battery features & data's and working on developing a driver and customer mobile application in Swift & Flutter from scratch.",
    "We are fetching live battery data from firebase and showing it on the customer app. Also fetching real time truck battery data and driver location.",
    "Used google map to show assigned live driver location on customer app.",
  ];

  final List<String> tecoCraftExperience = [
    "Designed and developed multiple applications using Swift & SwiftUI.",
    "Worked on product base & client base project in an iOS platform. And creating applications based on customer demands, trends and market gaps.",
    "Implemented hardware sensor activation with Libre2 Sensor.",
    "Used MVC, MVVM design pattern, Realm database, Firebase for chatting, push notifications and storing auth credentials, Payment gateways (Apple pay, Stripe).",
    "Optimization and migration of Core Data.",
  ];

  final List<String> varshaWebLabsExperience = [
    "Designed and developed multiple applications using Swift & Flutter.",
    "Planned, researched and developed program logic and code tests.",
    "Collaborated with design teams to effectively meet development requirements and enhance user experiences.",
    "Maintaining, optimizing, troubleshooting, improving and implementing new features in the app.",
    "Used MVC design pattern, Realm database, Firebase for chatting, push notifications and Payment gateways (Payumoney, Stripe, Paypal).",
    "Learned how to upload applications on the app store.",
  ];

  final List<String> brainWavesExperience = [
    "I worked with swift language.",
    "Learned with Apple UI/UX pattern.",
    "Learned MVC coding structure and project structure.",
  ];

  final List<String> zapPowerUsedLanguages = ["SwiftUI", "Flutter", "MVVM", "Dio", "Riverpod", "Provider", "Firebase", "Charts", "Stripe", ];
  final List<String> tecoCraftUsedLanguages = ["SwiftUI", "MVVM", "MVC", "Socket.io", "BLE", "Hardware Activation", "Charts", "Stripe", "Combine", ];
  final List<String> varshaWebLabsUsedLanguages = ["Swift", "UIKit", "Flutter", "Dio", "MVC", "MVVM", "Firebase", "Charts", "Stripe", "Analytics"];
  final List<String> brainWavesUsedLanguages = ["Swift", "UIKit", "MVC", "Alamofire"];

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
      color: AppColors.littleBlackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          SectionTitleView(title: "Work Experience", textColor: AppColors.appWhiteColor),

          Padding(
            padding: EdgeInsetsGeometry.only(left: 15),
            child: Column(
              spacing: 25,
              children: [
                zapPowerExperienceView(),
                tecoCraftInfusionExperienceView(),
                varshaWebLabsExperienceView(),
                brainWavesExperienceView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //  Company Experience
  Widget zapPowerExperienceView() {
    return Column(
      children: [
        _companyNameView(companyName: "ZAP Power FZCO", year: "July 2023 - Present"),
        _designationLocationView(designation: "iOS & Flutter App Developer", location: "Dubai, UAE"),

        const SizedBox(height: 10,),
        _commonExperienceView(experience: zapPowerExperience, usedLanguages: zapPowerUsedLanguages),
      ],
    );
  }

  Widget tecoCraftInfusionExperienceView() {
    return Column(
      children: [
        _companyNameView(companyName: "Tecocraft Infusion PVT LTD", year: "August 2020 – May 2023"),
        _designationLocationView(designation: "Sr. iOS Application Developer", location: "Surat, India"),

        const SizedBox(height: 10,),
        _commonExperienceView(experience: tecoCraftExperience, usedLanguages: tecoCraftUsedLanguages),
      ],
    );
  }

  Widget varshaWebLabsExperienceView() {
    return Column(
      children: [
        _companyNameView(companyName: "Varshaa WebLabs", year: "March 2018 – August 2020"),
        _designationLocationView(designation: "iOS Application Developer", location: "Surat, India"),

        const SizedBox(height: 10,),
        _commonExperienceView(experience: varshaWebLabsExperience, usedLanguages: varshaWebLabsUsedLanguages),
      ],
    );
  }

  Widget brainWavesExperienceView() {
    return Column(
      children: [
        _companyNameView(companyName: "BrainWaves", year: "November 2017 – February 2018"),
        _designationLocationView(designation: "Jr. iOS Application Developer", location: "Surat, India"),

        const SizedBox(height: 10,),
        _commonExperienceView(experience: brainWavesExperience, usedLanguages: brainWavesUsedLanguages),
      ],
    );
  }

  /// Company Name & Year View
  Widget _companyNameView({required String companyName, required String year}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          companyName,
          style: GoogleFonts.lato(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: AppColors.appWhiteColor,
          ),
          textAlign: TextAlign.left,
        ),

        Text(
          year,
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.greyColor,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  /// Designation & Location View
  Widget _designationLocationView({required String designation, required String location}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          designation,
          style: GoogleFonts.lato(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.orangeColor.shade700,
          ),
          textAlign: TextAlign.left,
        ),

        Text(
          location,
          style: GoogleFonts.lato(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.greyColor.shade700,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  /// Common Experience View
  Widget _commonExperienceView({required List<String> experience, required List<String> usedLanguages}) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: AppColors.lightBlackColor.withValues(alpha: 0.7),
        border: Border(
          top: BorderSide(color: AppColors.orangeColor.withValues(alpha: 0.5), width: 0.5),
          bottom: BorderSide(color: AppColors.orangeColor.withValues(alpha: 0.5), width: 0.5),
          left: BorderSide(color: AppColors.orangeColor.withValues(alpha: 0.5), width: 4.5),
          right: BorderSide(color: AppColors.orangeColor.withValues(alpha: 0.5), width: 0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: experience.map((data) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundColor: AppColors.orangeColor, maxRadius: 3,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Text(
                      data,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.appWhiteColor.withValues(alpha: 0.6),
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              )).toList(),
            ),

              const SizedBox(height: 20,),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: usedLanguages
                    .map((data) => _usedLanguagesView(title: data))
                    .toList(),
              ),
            ],
          ),
      ),
    );
  }


  ///  Used Language View
  Widget _usedLanguagesView({required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBlackColor,
        border: Border.all(color: AppColors.orangeColor.withValues(alpha: 0.2), width: 0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.appWhiteColor.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    );
  }
}

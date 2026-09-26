import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});

  final List<Map<String, dynamic>> experiencesData = [
    {
      "company_name": "ZAP Power FZCO",
      "position": "iOS & Flutter App Developer",
      "present_year": "August 2023 - Present",
      "location": "Dubai, UAE",
      "experience": [
        "Led the development of iOS and Flutter applications from scratch, including architecture, feature development, and project execution.",
        "Developed battery monitoring, real-time data tracking, Firebase integration, and Google Maps-based live location features.",
        "Optimize application performance, UI Responsiveness, and code quality while delivering scalable mobile solutions.",
      ],
      "used_languages": ["SwiftUI", "Flutter", "MVVM", "Dio", "Riverpod", "Provider", "Firebase", "Charts", "Stripe", ],
    },
    {
      "company_name": "Tecocraft Infusion PVT LTD",
      "position": "Sr. iOS Application Developer",
      "present_year": "August 2020 – May 2023",
      "location": "India, Surat",
      "experience": [
        "Designed and developed native iOS applications using Swift, SwiftUI, and MVVM for product-based and client projects.",
        "Collaborated directly with clients on requirements, project estimation, technical solutions, and delivery while working with a team of 4–5 developers.",
        "Integrated REST APIs, GraphQL, Firebase, Payment gateways, Push notifications, Libre2 sensor integration, Core Data, and Realm.",
        "Led multiple projects simultaneously and contributed to code reviews, performance optimization, technical research, and production support.",
      ],
      "used_languages": ["SwiftUI", "MVVM", "MVC", "Socket.io", "BLE", "NFC", "Hardware Activation", "Charts", "GraphQL" "Stripe", "Combine", ],
    },
    {
      "company_name": "Varshaa WebLabs",
      "position": "iOS Application Developer",
      "present_year": "March 2018 – August 2020",
      "location": "India, Surat",
      "experience": [
        "Developed native iOS and Flutter applications across the complete mobile development lifecycle.",
        "Gathered requirements, developed new features, resolved live production issues, and optimized application performance.",
        "Integrated REST APIs, Firebase, Realm, Unit testing, and payment gateways including Stripe, Apple pay, PayPal, and PayUmoney.",
        "Collaborated with designers and senior developers and contributed to App Store deployment and successfully client project delivery.",
      ],
      "used_languages": ["Swift", "UIKit", "Flutter", "Dio", "MVC", "MVVM", "Firebase", "Charts", "Stripe", "Analytics"],
    },
    {
      "company_name": "BrainWaves",
      "position": "Jr. iOS Application Developer",
      "present_year": "November 2017 – February 2018",
      "location": "India, Surat",
      "experience": [
        "Built a strong foundation in Swift, iOS Development, Apple design principles, and application architecture.",
        "Built user interfaces, integrated REST APIs, and followed clean coding and scalable development practices.",
      ],
      "used_languages": ["Swift", "UIKit", "MVC", "Alamofire"],
    },
  ];


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
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 0 : 25,
            ),
            child: Divider(color: AppColors.cyanColor.withValues(alpha: 0.4),),
          ),

          // SECTION TITLE
          SectionTitleView(title: "Work Experience", textColor: AppColors.appWhiteColor),

          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              spacing: 30,
              children: experiencesData.map((experience) =>
                  companyExperienceView(context, experience: experience))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  //  Company Experience
  Widget companyExperienceView(BuildContext context, {required Map<String, dynamic> experience}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        if (Responsive.isMobile(context))
          _buildMobileLayout(context,
            companyName: experience["company_name"],
            position: experience["position"],
            year: experience["present_year"],
            location: experience["location"],
          )
        else
          _buildDesktopLayout(context,
            companyName: experience["company_name"],
            position: experience["position"],
            year: experience["present_year"],
            location: experience["location"],
          ),

        SizedBox(height: Responsive.isMobile(context) ? 0 : 5,),
        _commonExperienceView(context, experience: experience["experience"], usedLanguages: experience["used_languages"]),
      ],
    );
  }

  /// Company & Position Mobile Layout
  Widget _buildDesktopLayout(BuildContext context, {
    required String companyName,
    required String position,
    required String year,
    required String location,
  }) {
    return Column(
      children: [
        _companyNameYearView(context, companyName: companyName, year: year),
        const SizedBox(height: 3,),
        _designationLocationView(designation: position, location: location),
      ],
    );
  }


  /// Company & Position Mobile Layout
  Widget _buildMobileLayout(BuildContext context, {
    required String companyName,
    required String position,
    required String year,
    required String location,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _companyNameView(context,
          companyName: companyName,
          fontSize: Responsive.scale(context, min: 15, max: 30),
        ),
        const SizedBox(height: 3,),

        _designationView(context,
          designation: position,
          fontSize: Responsive.isMobile(context)
              ? Responsive.scale(context, min: 12, max: 22) : 14,
        ),

        _yearLocationView(context,
          year: year,
          location: location,
          fontSize: Responsive.isMobile(context)
              ? Responsive.scale(context, min: 8, max: 15) : 12,
        ),
      ],
    );
  }

  /// Company Name & Year View
  Widget _companyNameYearView(BuildContext context, {required String companyName, required String year}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _companyNameView(context,
          companyName: companyName,
          fontSize: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 10, max: 21) : 17,
        ),

        _yearView(context,
          year: year,
          fontSize: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 8, max: 14) : 12,
        ),
      ],
    );
  }

  /// Designation & Location View
  Widget _designationLocationView({required String designation, required String location}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLabelTextView(
          designation,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          textColor: AppColors.cyanColor.shade200,
          textAlign: TextAlign.left,
        ),

        AppLabelTextView(
          location,
          fontSize: 13,
          fontWeight: FontWeight.w700,
          textColor: AppColors.greyColor.shade700,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  /// Common Experience View
  Widget _commonExperienceView(BuildContext context, {required List<String> experience, required List<String> usedLanguages}) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: AppColors.lightBlackColor.withValues(alpha: 0.7),
        border: Border(
          top: BorderSide(color: AppColors.cyanColor.shade300.withValues(alpha: 0.5), width: 0.5),
          bottom: BorderSide(color: AppColors.cyanColor.shade300.withValues(alpha: 0.5), width: 0.5),
          left: BorderSide(color: AppColors.cyanColor.shade300.withValues(alpha: 0.5), width: 4.5),
          right: BorderSide(color: AppColors.cyanColor.shade300.withValues(alpha: 0.5), width: 0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          Responsive.isMobile(context)
              ? Responsive.scale(context, min: 7, max: 20) : 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: experience.map((data) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  //  Dot Circle
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: CircleAvatar(
                      backgroundColor: AppColors.cyanColor,
                      radius: 3,
                    ),
                  ),

                  SizedBox(
                    width: Responsive.isMobile(context)
                        ? Responsive.scale(context, min: 7, max: 10) : 10,
                  ),

                  Expanded(
                    child: AppLabelTextView(
                      data,
                      fontSize: Responsive.isMobile(context)
                          ? Responsive.scale(context, min: 11.5, max: 18.5) : 13,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.appWhiteColor.withValues(alpha: 0.6),
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
                    .map((data) => _usedLanguagesView(context, title: data))
                    .toList(),
              ),
            ],
          ),
      ),
    );
  }

  /// Company Name
  Widget _companyNameView(BuildContext context, {required String companyName, required double fontSize}) {
    return AppLabelTextView(
      companyName,
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      textColor: AppColors.appWhiteColor,
      textAlign: TextAlign.left,
    );
  }

  /// Designation
  Widget _designationView(BuildContext context, {required String designation, required double fontSize}) {
    return AppLabelTextView(
      designation,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      textColor: AppColors.cyanColor.shade200,
      textAlign: TextAlign.left,
    );
  }

  /// Year View
  Widget _yearView(BuildContext context, {required String year, required double fontSize}) {
    return AppLabelTextView(
      year,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      textColor: AppColors.greyColor,
      textAlign: TextAlign.left,
    );
  }

  /// Year Location View
  Widget _yearLocationView(BuildContext context, {required String year, required String location, required double fontSize}) {
    return AppLabelTextView(
      "$year  |  $location",
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      textColor: AppColors.greyColor,
      textAlign: TextAlign.left,
    );
  }

  ///  Used Language View
  Widget _usedLanguagesView(BuildContext context, {required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBlackColor,
        border: Border.all(color: AppColors.cyanColor.withValues(alpha: 0.2), width: 0.7),
        borderRadius: BorderRadius.circular(
          Responsive.isMobile(context)
              ? Responsive.scale(context, min: 6, max: 10) : 10,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: AppLabelTextView(
          title,
          fontSize: Responsive.isMobile(context)
              ? Responsive.scale(context, min: 8, max: 15) : 12,
          fontWeight: FontWeight.w400,
          textColor: AppColors.appWhiteColor.withValues(alpha: 0.6),
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    );
  }
}

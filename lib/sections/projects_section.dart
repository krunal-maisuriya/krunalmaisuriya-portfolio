import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
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
      appName: "ZAP Solar",
      description: "ZAP Solar is a smart solar energy management application currently under development, designed to help users monitor solar plant performance, track energy production and consumption, view billing details, manage equipments, contracts, and maintenance service, while providing comprehensive analytics and system insights. ",
      image: "",
      tags: ["Flutter", "Dart", "Firebase", "Charts", "Dio", "Riverpod"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Under Development",
    ),
    ProjectModel(
      appName: "Zap Power App (Customer)",
      description: "ZAP Power App is a smart home energy subscription application currently under development that enables customers to power their homes through a battery-based energy service. "
          "\n\nDeveloped the app from the scratch with enhanced features - subscription and contract management, battery delivery and installation tracking, energy usage monitoring, billing and payment modules, charging service scheduling, real-time service status tracking, push notifications, API integrations, and performance optimizations to deliver a seamless and user-friendly experience.",
      image: "",
      tags: ["Flutter", "Dart", "Firebase", "Charts", "Dio", "Riverpod", "GoogleMaps", "pdfviewer", "Stripe", "Apple Pay"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Under Development",
    ),
    // Project(
    //   appName: "Zap Driver App",
    //   description: "Bio music is a mediation music app that helps to improve health, reduce stress and feel you relax.",
    //   image: "",
    //   tags: ["Flutter", "Firebase", "Maps"],
    //   iosAppLink: "https://apps.apple.com/us/app/firmpet-app/id1641636133",
    //   androidAppLink: "",
    //   githubLink: "",
    //   projectStatus: "Under Development",
    // ),
    ProjectModel(
      appName: "Bio Music One",
      description: "Bio music is a mediation music app that helps to improve health, reduce stress and feel you relax.",
      image: "",
      tags: ["Swift", "UIKit", "MVVM", "API", "Subscription", "audio player"],
      iosAppLink: "https://apps.apple.com/fr/app/bio-music-one/id1598573976",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Live",
    ),
    ProjectModel(
      appName: "FirmPet",
      description: "FirmPet is an advanced Health Monitoring App with curated features for pet health. A uniquely designed app, that offering tracking the pet's daily activities, Glucose level. "
          "\n\nBuilt a SwiftUI-based pet health monitoring application with Libre2 sensor integration, custom analytics charts, and multi-pet profile management. "
          "\n\nImplemented personalized data tracking, monitor pet's metabolic score, meal score insights, integrate pet profile, and doctor assignment features to enhance pet healthcare management.",
          // "\nImplemented personalized data tracking, monitor pet's metabolic score, meal score insights, integrate pet profile, training and music video therapy, and doctor assignment features to enhance pet healthcare management.",
      image: "",
      tags: ["SwiftUI", "MVVM", "Firebase", "Charts", "URLSession", "Encryption/Decryption", "Combine", "CGM Sensor Activation", "BLE", "NFC", "Youtube Player"],
      iosAppLink: "https://apps.apple.com/us/app/firmpet-app/id1641636133",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Live",
    ),
    ProjectModel(
      appName: "My Virtual Business Card",
      description: "MVBC is the best online business card offering an innovative platform to manage your professional business cards on your mobile phone. "
          "\n\nClient can scanned and stored traditional business cards in the app and share business card with colleagues. "
          "\n\nImplemented Authentication, In-app purchases, Firebase real-time chat with online/offline status, show active cards, sharing business card on social media and fixed issues.",
      image: "",
      tags: ["Swift", "MVVM", "Firebase", "Chatting", "In-app purchase", "Barcode Scanner"],
      iosAppLink: "https://apps.apple.com/us/app/my-virtual-business-card/id1544764504",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Live",
    ),
    ProjectModel(
      appName: " ",
      description: "Vighnaraja Textile Agency is an integrated organization providing complete Textile Sarees and Lahanga's collection to its clients nationwide. "
          "\n\nFeatures: "
          "\n - User profile "
          "\n - Real time Order Entry "
          "\n - Sale Outstanding Reports"
          "\n - Contact Master with G.S.T Number"
          "\n - User Management, Create new user"
          "\n - Invoice, Ledger with Reports"
          "\n - Order clearing tools",
      image: "",
      tags: ["Swift", "UIKit", "Alamofire", "Firebase", "MVC", "Restful API", "Push Notifications"],
      iosAppLink: "https://apps.apple.com/us/app/vighnaraja-textile-agency/id1569863689",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Live",
    ),
    ProjectModel(
      appName: "Sunil Kr Anil Kr",
      description: "Sunil Kr Anil Kr is an integrated organization providing complete Textile Sarees and Lahanga's collection to its clients nationwide. "
          "\n\nFeatures: "
          "\n - Dashboard "
          "\n - Real time Order Entry "
          "\n - Sale/Purchase Reports"
          "\n - Contact Master with G.S.T Number"
          "\n - User Management, Create new user"
          "\n - Invoice, Ledger with Reports"
          "\n - Order clearing tools",
      image: "",
      tags: ["Swift", "UIKit", "Alamofire", "Firebase", "MVC", "Restful API", "Push Notifications"],
      iosAppLink: "https://apps.apple.com/us/app/sunil-kr-anil-kr/id1585011939",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Live",
    ),
    ProjectModel(
      appName: "ParkForU - Driver",
      description: "Designed and developed the driver-side application for an airport valet and transportation service, enabling drivers to efficiently manage pickup and drop-off operations. "
          "\n\nImplemented secure trip management, Profile creation, ride acceptance/decline workflow, manage online/offline availability status and driver shifts tracking. "
      // "\nFocused on delivering a reliable and seamless experience for drivers while improving overall operational efficiency."
          "\n\nThe application was previously deployed for the client and is no longer publicly available.",
      image: "",
      tags: ["Swift", "UIKit", "Firebase", "Alamofire", "MVC", "Rest API", "Push Notification", "Payment Integration"],
      iosAppLink: "https://apps.apple.com/ca/app/park-for-u-driver/id1144908143",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "No Longer Available",
    ),
    ProjectModel(
      appName: "Score Ice - Hockey",
      description: "Developed and enhanced a hockey arena booking platform where arena managers create playing slots and users can discover and book available hockey sessions. "
          """"\n\nImplemented advanced slot filtering based on date, time, and distance, developed the "Make Offer" feature for arena bookings, enhanced map-based slot discovery, and resolved critical UI and performance issues to improve the overall user experience.""""",
      image: "",
      tags: ["Swift", "UIKit", "MVVM", "Rest API", "Fastlane", "Firebase", "Stripe", "FSCalendar", "Google Maps"],
      iosAppLink: "https://apps.apple.com/us/app/score-ice/id1424884700",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "Live",
    ),
    ProjectModel(
      appName: "Mahogany Real Estate",
      description: "A Canadian real estate app enabling users to discover, buy, and sell properties with smart filters, map-based search, saved listings, and location-based services."
          "\n\nFeatures:"
          "\n - Buy & Sell Properties"
          "\n - Advanced Search Filters (price, property type, bedrooms, bathrooms, homes for sale or rent)"
          "\n - Favorite & Saved Listings"
          "\n - Nearby Amenities (gas stations, schools, grocery stores, and more)"
          "\n - Seller Contact Info",
      image: "",
      tags: ["Swift", "UIKit", "MVC", "Rest API", "Alamofire", "Firebase", "Google Maps", "Social Login", "Location Services"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "No Longer Available",
    ),
    ProjectModel(
      appName: "The RealtyDen",
      description: "A Canadian real estate app enabling users to discover, buy, and sell properties with smart filters, map-based search, polygon, saved listings, and location-based services."
          "\n\nFeatures:"
          "\n - Buy & Sell Properties"
          "\n - Advanced Search Filters (price, property type, bedrooms, bathrooms, homes for sale or rent)"
          "\n - Favorite & Saved Listings"
          "\n - Draw Polygon on map"
          "\n - Nearby Amenities (gas stations, schools, grocery stores, and more)"
          "\n - Seller Contact Info",
      image: "",
      tags: ["Swift", "UIKit", "MVC", "Rest API", "Alamofire", "Firebase", "Google Maps", "Social Login", "Polygon", "Location Services"],
      iosAppLink: "",
      androidAppLink: "",
      githubLink: "",
      projectStatus: "No Longer Available",
    ),
    ProjectModel(
      appName: "Shree Khalashi Timala Punch",
      description: "This app provides community details, upcoming news and events. "
          "\n\n Developed the app from the scratch with enhanced features - Get latest news, Upcoming Competitions & Games, All Community Details, User Profile."
          "\n\n This application was previously deployed for the client and is no longer available on the App Store. It remains available on Google Play Store.",
      image: "",
      tags: ["Flutter", "Firebase", "Dio", "MVVM", "Push Notification"],
      iosAppLink: "https://apps.apple.com/in/app/khalashi-timla-panch-rander/id1497844584",
      androidAppLink: "https://play.google.com/store/apps/details?id=com.varshaaweblabs.shreekhalashitimalapanchrander",
      githubLink: "",
      projectStatus: "Live",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Responsive.scale(context, min: 5, max: 40),
        right: Responsive.scale(context, min: 5, max: 40),
        bottom: 50,
      ),
      color: Color(0XFF121216),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 0 : 25,
            ),
            child: Divider(color: AppColors.cyanColor.withValues(alpha: 0.4),),
          ),

          // SECTION TITLE
          const SizedBox(height: 30),
          SectionTitleView(title: "Projects", textColor: AppColors.appWhiteColor,),
          const SizedBox(height: 10),

          // HORIZONTAL RESPONSIVE LAYOUT
          LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            int columns;

            if (width < 600) {
              columns = 1;
            } else if (width < 1000) {
              columns = 2; // tablet
            } else {
              columns = 3; // desktop
            }

            double itemWidth = (width - (columns - 1) * 20) / columns;
            return Wrap(
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
            );
          }),
        ],
      ),
    );
  }

  //  Projects Data section
  Widget _projectsDataView({
    required int index,
    required ProjectModel data,
  }) {
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
        padding: EdgeInsets.only(
          top: 15, bottom: 25,
          left: Responsive.isMobile(context) ? Responsive.scale(context, min: 5, max: 16) : 16,
          right: Responsive.isMobile(context) ? Responsive.scale(context, min: 5, max: 16) : 16,
        ),
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
            // TITLE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppLabelTextView(
                    data.appName,
                    fontSize: Responsive.isMobile(context)
                        ? Responsive.scale(context, min: 13, max: 24) : 17,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.cyanColor.shade400,
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (data.githubLink.isNotEmpty)
                      GestureDetector(
                        onTap: () => openUrl(data.githubLink),
                        child: const FaIcon(FontAwesomeIcons.github),
                      ),

                    if (data.githubLink.isNotEmpty &&
                        (data.iosAppLink.isNotEmpty ||
                            data.androidAppLink.isNotEmpty))
                      const SizedBox(width: 8),

                    if (data.iosAppLink.isNotEmpty)
                      GestureDetector(
                        onTap: () => openUrl(data.iosAppLink),
                        child: Image.asset(
                          "assets/ic_appstore.jpeg",
                          width: Responsive.isMobile(context)
                              ? Responsive.scale(context, min: 10, max: 24) : 20,
                          height: Responsive.isMobile(context)
                              ? Responsive.scale(context, min: 10, max: 24) : 20,
                        ),
                      ),

                    if (data.iosAppLink.isNotEmpty &&
                        data.androidAppLink.isNotEmpty)
                      const SizedBox(width: 8),

                    if (data.androidAppLink.isNotEmpty)
                      GestureDetector(
                        onTap: () => openUrl(data.androidAppLink),
                        child: Image.asset(
                          "assets/ic_playstore.jpeg",
                          width: Responsive.isMobile(context)
                              ? Responsive.scale(context, min: 10, max: 22) : 18,
                          height: Responsive.isMobile(context)
                              ? Responsive.scale(context, min: 10, max: 22) : 18,
                        ),
                      ),
                  ],
                ),
              ],
            ),

            SizedBox(height: Responsive.isMobile(context) ? 4 : 8),

            // project Status
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: Responsive.isMobile(context)
                            ? Responsive.scale(context, min: 5, max: 15) : 15,
                      ),
                      decoration: BoxDecoration(
                        color: data.projectStatus == "Live"
                            ? AppColors.darkGreenColor.withValues(alpha: 0.3)
                            : data.projectStatus == "Under Development"
                            ? AppColors.orangeColor.withValues(alpha: 0.05)
                            : data.projectStatus == "No Longer Available"
                            ? AppColors.redColor.withValues(alpha: 0.1)
                            : AppColors.lightBlackColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 0.8,
                          color: data.projectStatus == "Live"
                              ? AppColors.darkGreenColor.withValues(alpha: 0.7)
                              : data.projectStatus == "Under Development"
                              ? AppColors.orangeColor.withValues(alpha: 0.5)
                              : data.projectStatus == "No Longer Available"
                              ? AppColors.redColor.withValues(alpha: 0.5)
                              : AppColors.lightWhiteColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: AppLabelTextView(
                        data.projectStatus,
                        fontSize: Responsive.isMobile(context)
                            ? Responsive.scale(context, min: 6, max: 15) : 10,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.appWhiteColor.withValues(alpha: 0.7),
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 16, max: 25) : 20,
            ),

            AppLabelTextView(
              data.description,
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 11, max: 18) : 13,
              fontWeight: FontWeight.w400,
              textColor: AppColors.appWhiteColor.withValues(alpha: 0.7),
            ),

            SizedBox(height: Responsive.isMobile(context) ? 20 : 25,),

            //  Tags
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: data.tags
                  .map((tag) => TagsView(title: tag))
                  .toList(),
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

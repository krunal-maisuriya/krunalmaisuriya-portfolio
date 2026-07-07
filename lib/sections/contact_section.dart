import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/social_link_helper.dart';
import 'package:krunal_portfolio/core/widgets/contact_me_hover_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      color: AppColors.appBlackColor,
      child: Column(
        children: [
          Text(
            "Get In Touch",
            // "Let's Connect",
            style: GoogleFonts.lato(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.appWhiteColor,
            ),
          ),

          const SizedBox(height: 10),
          Text(
            "I am always interested in new opportunities or projects. Feel free to contact me to work together.",
            style: GoogleFonts.lato(
              fontSize: 17,
              color: AppColors.greyColor,
            ),
          ),

          const SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Information",
                style: GoogleFonts.lato(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: AppColors.appWhiteColor,
                ),
              ),

              const SizedBox(height: 30,),

              LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 900;

                  return Padding(
                    padding: EdgeInsets.only(left: isDesktop ? 40 : 20, right: isDesktop ? 40 : 20, top: 0, bottom: 20),
                    child: isDesktop
                        ? _buildDesktopLayoutView()
                        : _buildMobileLayoutView(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


  //  DESKTOP VIEW
  Widget _buildDesktopLayoutView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 20,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => sendEmail(),
                child: _contactInformationView(
                  icon: Icons.email_outlined, title: "Email", value: "akkimaisuriya@gmail.com",
                ),
              ),

              const SizedBox(height: 15,),
              GestureDetector(
                onTap: () => callPhone(),
                child: _contactInformationView(
                  icon: Icons.phone_outlined, title: "Phone", value: "+971 502883728",
                ),
              ),

              const SizedBox(height: 15,),
              _contactInformationView(
                icon: Icons.location_on_outlined, title: "Location", value: "Dubai, United Arab Emirates",
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            constraints: const BoxConstraints(minHeight: 260),
            padding: EdgeInsets.only(left: 25, right: 40, top: 20, bottom: 15),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor.shade800.withValues(alpha: 0.8)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LET'S WORK TOGETHER",
                  style: GoogleFonts.lato(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: AppColors.appWhiteColor,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 15,),

                Text(
                  "I'm available for Flutter and iOS development projects, app maintenance, feature enhancements, and technical consulting. Let's connect and create impactful mobile experiences.",
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.appWhiteColor.withValues(alpha: 0.5),
                  ),
                ),

                const SizedBox(height: 15,),

                ContactMeHoverButton(
                  title: "Connect Me", onTap: () => sendEmail(),
                ),

                const SizedBox(height: 20,),

                Row(
                  spacing: 10,
                  children: [
                    //  LinkedIn
                    GestureDetector(
                      onTap: () => openLinkedIn(),
                      child: socialContactLink("LinkedIn", FontAwesomeIcons.linkedinIn),
                    ),

                    //  Github
                    GestureDetector(
                      onTap: () => openGithub(),
                      child: socialContactLink("Github", FontAwesomeIcons.github),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //  MOBILE VIEW
  Widget _buildMobileLayoutView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => sendEmail(),
          child: _contactInformationView(
            icon: Icons.email_outlined, title: "Email", value: "akkimaisuriya@gmail.com",
          ),
        ),

        const SizedBox(height: 15,),
        GestureDetector(
          onTap: () => callPhone(),
          child: _contactInformationView(
            icon: Icons.phone_outlined, title: "Phone", value: "+971 502883728",
          ),
        ),
        const SizedBox(height: 15,),

        _contactInformationView(
          icon: Icons.location_on_outlined, title: "Location", value: "Dubai, United Arab Emirates",
        ),
        const SizedBox(height: 25,),

        Container(
          constraints: const BoxConstraints(minHeight: 260),
          padding: EdgeInsets.only(left: 25, right: 40, top: 20, bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor.shade800.withValues(alpha: 0.8)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LET'S WORK TOGETHER",
                style: GoogleFonts.lato(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: AppColors.appWhiteColor,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 15,),

              Text(
                "I'm available for Flutter and iOS development projects, app maintenance, feature enhancements, and technical consulting. Let's connect and create impactful mobile experiences.",
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.appWhiteColor.withValues(alpha: 0.5),
                ),
              ),

              const SizedBox(height: 15,),

              ContactMeHoverButton(
                title: "Connect Me", onTap: () => sendEmail(),
              ),

              const SizedBox(height: 20,),

              //  LinkedIn
              Row(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () => openLinkedIn(),
                    child: socialContactLink("LinkedIn", FontAwesomeIcons.linkedinIn),
                  ),

                  //  Github
                  GestureDetector(
                    onTap: () => openGithub(),
                    child: socialContactLink("Github", FontAwesomeIcons.github),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  //  Contact Information
  Widget _contactInformationView({required IconData icon, required String title, required String value}) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor.shade800.withValues(alpha: 0.8)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 15,
        children: [
          Container(
            width: 45, height: 45,
            decoration: BoxDecoration(
              color: AppColors.orangeColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.orangeColor, width: 0.5),
            ),
            child: Icon(icon, color: AppColors.orangeColor,),
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appWhiteColor.withValues(alpha: 0.5),
                ),
              ),

              GestureDetector(
                onTap: () {

                },
                child: Text(
                  value,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.appWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //  Contact Link
  Widget socialContactLink(String title, IconData icon) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.lightBlackColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.orangeColor.shade700, width: 0.5),
      ),
      child: Row(
        children: [
          FaIcon(icon, color: AppColors.lightWhiteColor, size: 20),
          const SizedBox(width: 10,),
          Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.lightWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
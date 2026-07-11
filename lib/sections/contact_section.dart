import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/utils/helper/social_link_helper.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
import 'package:krunal_portfolio/core/widgets/contact_me_hover_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.scale(context, min: 0, max: 40),
      ),
      color: Color(0XFF121216),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              top: 0, bottom: 35,
              left: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 5, max: 25) : 25,
              right: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 5, max: 25) : 25,
            ),
            child: Divider(color: AppColors.cyanColor.withValues(alpha: 0.4),),
          ),

          AppLabelTextView(
            "Get In Touch",
            fontSize: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 10, max: 40)
                : 35,
            fontWeight: FontWeight.bold,
            textColor: AppColors.appWhiteColor,
          ),

          const SizedBox(height: 10),
          AppLabelTextView(
            "I am always interested in new opportunities or projects. Feel free to contact me to work together.",
            fontSize: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 5, max: 14)
                : 14,
            fontWeight: FontWeight.w500,
            textColor: AppColors.greyColor,
            textAlign: TextAlign.center,
          ),


          //  Contact Info View
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Responsive.scale(context, min: 20, max: 45),),

              LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 850;

                  return Padding(
                    padding: EdgeInsets.only(
                      left: Responsive.isMobile(context) ? 0 : Responsive.scale(context, min: 5, max: 40),
                      right: Responsive.isMobile(context) ? 0 : Responsive.scale(context, min: 5, max: 40),
                      top: 0, bottom: 20,
                    ),
                    child: isDesktop
                        ? _buildDesktopLayoutView(context)
                        : _buildMobileLayoutView(context),
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
  Widget _buildDesktopLayoutView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: Responsive.scale(context, min: 5, max: 25),
      children: [
        /// CONTACT ME
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => sendEmail(),
                child: _contactInformationView(
                  context: context,
                  icon: Icons.email_outlined, title: "Email", value: "akkimaisuriya@gmail.com",
                ),
              ),

              const SizedBox(height: 15,),
              GestureDetector(
                onTap: () => callPhone(),
                child: _contactInformationView(
                  context: context,
                  icon: Icons.phone_outlined, title: "Phone", value: "+971 502883728",
                ),
              ),

              const SizedBox(height: 15,),
              _contactInformationView(
                context: context,
                icon: Icons.location_on_outlined, title: "Location", value: "Dubai, United Arab Emirates",
              ),
            ],
          ),
        ),

        /// LET"S WORK TOGETHER
        Expanded(
          child: Container(
            constraints: BoxConstraints(minHeight: Responsive.scale(context, min: 230, max: 260)),
            padding: EdgeInsets.only(
              left: Responsive.scale(context, min: 15, max: 25),
              right: Responsive.scale(context, min: 15, max: 25),
              top: 20, bottom: 25,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor.shade800.withValues(alpha: 0.8)),
              borderRadius: BorderRadius.circular(Responsive.scale(context, min: 7, max: 10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                letsWorkTogether(context),
                const SizedBox(height: 15,),

                letsWorkTogetherDesc(context),
                const SizedBox(height: 25,),

                ContactMeHoverButton(
                  title: "Connect Me", onTap: () => sendEmail(),
                ),

                const SizedBox(height: 20,),

                Row(
                  spacing: Responsive.scale(context, min: 6, max: 10),
                  children: [
                    //  LinkedIn
                    Flexible(
                      child: GestureDetector(
                        onTap: () => openLinkedIn(),
                        child: socialContactLink(context, "LinkedIn", FontAwesomeIcons.linkedinIn),
                      ),
                    ),

                    //  Github
                    Flexible(
                      child: GestureDetector(
                        onTap: () => openGithub(),
                        child: socialContactLink(context, "Github", FontAwesomeIcons.github),
                      ),
                    ),
                    Spacer(),
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
  Widget _buildMobileLayoutView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //  Email
        GestureDetector(
          onTap: () => sendEmail(),
          child: _contactInformationView(
            context: context,
            icon: Icons.email_outlined, title: "Email", value: "akkimaisuriya@gmail.com",
          ),
        ),

        const SizedBox(height: 10,),
        //  Phone
        GestureDetector(
          onTap: () => callPhone(),
          child: _contactInformationView(
            context: context,
            icon: Icons.phone_outlined, title: "Phone", value: "+971 502883728",
          ),
        ),
        const SizedBox(height: 10,),

        //  Location
        _contactInformationView(
          context: context,
          icon: Icons.location_on_outlined, title: "Location", value: "Dubai, United Arab Emirates",
        ),
        const SizedBox(height: 25,),

        Container(
          constraints: BoxConstraints(minHeight: Responsive.scale(context, min: 210, max: 250)),
          padding: EdgeInsets.only(
            left: Responsive.scale(context, min: 5, max: 25),
            right: Responsive.scale(context, min: 5, max: 25),
            top: 20, bottom: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor.shade800.withValues(alpha: 0.8)),
            borderRadius: BorderRadius.circular(Responsive.scale(context, min: 8, max: 10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              letsWorkTogether(context),
              const SizedBox(height: 15,),

              letsWorkTogetherDesc(context),
              const SizedBox(height: 15,),

              ContactMeHoverButton(
                title: "Connect Me", onTap: () => sendEmail(),
              ),

              const SizedBox(height: 20,),

              //  LinkedIn
              Column(
                spacing: Responsive.scale(context, min: 6, max: 10),
                children: [
                  GestureDetector(
                    onTap: () => openLinkedIn(),
                    child: socialContactLink(context, "LinkedIn", FontAwesomeIcons.linkedinIn),
                  ),

                  //  Github
                  GestureDetector(
                    onTap: () => openGithub(),
                    child: socialContactLink(context, "Github", FontAwesomeIcons.github),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }


  ///  Contact Information
  Widget _contactInformationView({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 8, max: 15)
            : Responsive.isTablet(context)
              ? Responsive.scale(context, min: 8, max: 15)
              : 15,
        horizontal: Responsive.isMobile(context)
            ? Responsive.scale(context, min: 5, max: 25)
            : Responsive.isTablet(context)
            ? 20 : 25,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor.shade800.withValues(alpha: 0.8)),
        borderRadius: BorderRadius.circular(
          Responsive.isMobile(context) ? Responsive.scale(context, min: 7, max: 10) : 10,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 10, max: 45) : 45,
            height: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 10, max: 45) : 45,
            decoration: BoxDecoration(
              color: AppColors.cyanColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(
                Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 4, max: 10) : 10,
              ),
              border: Border.all(color: AppColors.cyanColor, width: 0.5),
            ),
            child: Icon(icon,
              color: AppColors.cyanColor,
              size: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 8, max: 25) : 26,
            ),
          ),

          SizedBox(width: Responsive.scale(context, min: 5, max: 15),),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppLabelTextView(
                  title,
                  fontSize: Responsive.isMobile(context)
                      ? Responsive.scale(context, min: 8, max: 15) : 13,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.appWhiteColor.withValues(alpha: 0.5),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),

                GestureDetector(
                  onTap: () {},
                  child: AppLabelTextView(
                    value,
                    fontSize: Responsive.isMobile(context)
                        ? Responsive.scale(context, min: 7, max: 18) : 15,
                    fontWeight: FontWeight.w800,
                    textColor: AppColors.appWhiteColor,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///  Let's Work Together
  Widget letsWorkTogether(BuildContext context) {
    return AppLabelTextView(
      "LET'S WORK TOGETHER",
      fontSize: Responsive.isMobile(context)
          ? Responsive.scale(context, min: 8, max: 18) : 18,
      fontWeight: FontWeight.w800,
      textColor: AppColors.appWhiteColor,
      letterSpacing: 2,
    );
  }

  ///  Lets Work Desc
  Widget letsWorkTogetherDesc(BuildContext context) {
    return AppLabelTextView(
      "I'm available for Flutter and iOS development projects, app maintenance, feature enhancements, and technical consulting. "
          "Let's connect and create impactful mobile experiences.",
      fontSize: Responsive.isMobile(context)
          ? Responsive.scale(context, min: 8, max: 14) : 11,
      fontWeight: FontWeight.w400,
      textColor: AppColors.appWhiteColor.withValues(alpha: 0.5),
    );
  }

  ///  Contact Link
  Widget socialContactLink(BuildContext context, String title, IconData icon) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Responsive.scale(context, min: 8, max: 12),
        horizontal: Responsive.scale(context, min: 5, max: 15),
      ),
      decoration: BoxDecoration(
        color: AppColors.lightBlackColor,
        borderRadius: BorderRadius.circular(Responsive.scale(context, min: 5, max: 10)),
        border: Border.all(color: AppColors.cyanColor.shade700, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            color: AppColors.lightWhiteColor,
            size: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 7, max: 18) : 18,
          ),

          SizedBox(width: Responsive.isMobile(context)
              ? Responsive.scale(context, min: 2, max: 12) : 10,
          ),

          Flexible(
            child: AppLabelTextView(
              title,
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 5.5, max: 15) : 13,
              fontWeight: FontWeight.w600,
              textColor: AppColors.lightWhiteColor,
              maxLines: 5,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
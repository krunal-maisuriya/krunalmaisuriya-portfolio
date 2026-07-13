import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';

class EducationsSection extends StatelessWidget {
  const EducationsSection({super.key});

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
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: Responsive.isMobile(context) ? 0 : 25,
            ),
            child: Divider(color: AppColors.cyanColor.withValues(alpha: 0.4),),
          ),

          // SECTION TITLE
          const SizedBox(height: 30),
          SectionTitleView(title: "Education", textColor: AppColors.appWhiteColor,),
          const SizedBox(height: 10),

          // HORIZONTAL RESPONSIVE LAYOUT
          Row(
            spacing: 15,
            children: [
              educationCardView(
                context,
                title: "Master Of Computer Applications (MCA)",
                clgName: "School of Computer Studies, Ahmedabad University",
                location: "Ahmedabad, Gujarat, India",
                passingYear: "Jun 2014 - Apr 2016",
              ),
              educationCardView(context,
                title: "Bachelor Of Computer Applications (BCA)",
                clgName: "Shree Uttar Gujarat BCA College, VNSGU",
                location: "Surat, Gujarat, India",
                passingYear: "Jun 2011 - Apr 2014",
              ),
            ],
          ),
        ],
      ),
    );
  }

  //  Education Card
  Widget educationCardView(BuildContext context, {
    required String title, required String clgName,
    required String location, required String passingYear,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 15, bottom: 25,
        left: Responsive.isMobile(context) ? Responsive.scale(context, min: 5, max: 16) : 16,
        right: Responsive.isMobile(context) ? Responsive.scale(context, min: 5, max: 25) : 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.cyanColor.shade900.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabelTextView(
            title,
            fontSize: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 8, max: 15) : 15,
            fontWeight: FontWeight.w700,
            textColor: AppColors.cyanColor.shade800,
          ),

          const SizedBox(height: 5,),

          AppLabelTextView(
            clgName,
            fontSize: Responsive.isMobile(context)
                ? Responsive.scale(context, min: 5, max: 13) : 11,
            fontWeight: FontWeight.w400,
            textColor: AppColors.appWhiteColor.withValues(alpha: 0.6),
          ),

          const SizedBox(height: 2,),

          Row(
            children: [
              Image.asset(
                "assets/ic_address_pin.jpeg",
                // color: AppColors.appWhiteColor,
                width: 28, height: 28,
              ),
              AppLabelTextView(
                location,
                fontSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 5, max: 13) : 11,
                fontWeight: FontWeight.w400,
                textColor: AppColors.appWhiteColor.withValues(alpha: 0.6),
              ),
            ],
          ),

          const SizedBox(height: 5,),

          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.cyanColor.shade800.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.cyanColor.shade800.withValues(alpha: 0.7), width: 1),
            ),
            child: AppLabelTextView(
              passingYear,
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 6, max: 12) : 12,
              fontWeight: FontWeight.w400,
              textColor: AppColors.appWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

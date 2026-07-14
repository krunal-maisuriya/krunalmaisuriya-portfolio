import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';
import 'package:krunal_portfolio/core/widgets/section_title_view.dart';
import 'package:krunal_portfolio/models/education_model.dart';

class EducationsSection extends StatefulWidget {
  const EducationsSection({super.key});

  @override
  State<EducationsSection> createState() => _EducationsSectionState();
}


class _EducationsSectionState extends State<EducationsSection> {
  int hoverIndex = -1;

  final List<EducationModel> educationData = [
    EducationModel(
      degree: "Master of Computer Applications (MCA)",
      clgName: "School of Computer Studies, Ahmedabad University",
      location: "Ahmedabad, Gujarat, India",
      passingYear: "Jun 2014  -  Apr 2016",
    ),
    EducationModel(
      degree: "Bachelor of Computer Applications (BCA)",
      clgName: "Shree Uttar Gujarat BCA College, VNSGU",
      location: "Surat, Gujarat, India",
      passingYear: "Jun 2011  -  Apr 2014",
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
          SectionTitleView(title: "Education", textColor: AppColors.appWhiteColor,),
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
              children: educationData.asMap().entries.map((entry) {
                int index = entry.key;
                EducationModel data = entry.value;

                return SizedBox(
                  width: itemWidth,
                  child: educationCardView(index: index, data: data),
                );
              }).toList(),
            );
          })
        ],
      ),
    );
  }

  //  Education Card
  Widget educationCardView({
    required int index,
    required EducationModel data,
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
        padding: EdgeInsets.only(
          top: 15, bottom: 25,
          left: Responsive.isMobile(context) ? Responsive.scale(context, min: 5, max: 16) : 16,
          right: Responsive.isMobile(context) ? Responsive.scale(context, min: 5, max: 25) : 25,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLabelTextView(
              data.degree,
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 12, max: 18) : 15,
              fontWeight: FontWeight.w700,
              textColor: AppColors.cyanColor.shade800,
            ),

            const SizedBox(height: 5,),

            AppLabelTextView(
              data.clgName,
              fontSize: Responsive.isMobile(context)
                  ? Responsive.scale(context, min: 10, max: 15) : 11,
              fontWeight: FontWeight.w400,
              textColor: AppColors.appWhiteColor.withValues(alpha: 0.6),
            ),

            const SizedBox(height: 2,),

            Row(
              children: [
                Image.asset(
                  "assets/ic_address_pin.jpeg",
                  width: 25, height: 25,
                ),
                Expanded(
                  child: AppLabelTextView(
                    data.location,
                    fontSize: Responsive.isMobile(context)
                        ? Responsive.scale(context, min: 10, max: 15) : 11,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.appWhiteColor.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.cyanColor.shade800.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.cyanColor.shade800.withValues(alpha: 0.7), width: 1),
              ),
              child: AppLabelTextView(
                data.passingYear,
                fontSize: Responsive.isMobile(context)
                    ? Responsive.scale(context, min: 10, max: 15) : 12,
                fontWeight: FontWeight.w400,
                textColor: AppColors.appWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

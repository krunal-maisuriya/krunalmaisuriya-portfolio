import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/utils/helper/social_link_helper.dart';
import 'package:krunal_portfolio/screens/header_view.dart';
import 'package:krunal_portfolio/sections/contact_section.dart';
import 'package:krunal_portfolio/sections/copy_right_section.dart';
import 'package:krunal_portfolio/sections/experience_section.dart';
import 'package:krunal_portfolio/sections/hero_sections.dart';
import 'package:krunal_portfolio/sections/projects_section.dart';
import 'package:krunal_portfolio/sections/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  bool isMenuOpen = false;
  int selectedVIndex = 0;

  final items = ["Home", "Experience", "Skills", "Projects", "Contact"];

  final homeKey = GlobalKey();
  final experienceKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();


  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      final offset = scrollController.offset + position.dy - 50;

      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //  MAIN PAGE CONTENT
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              spacing: 0,
              children: [
                Container(key: homeKey, child: HeroSections()),
                // Container(key: experienceKey, child: ExperienceSection()),
                Container(key: skillsKey, child: SkillsSection()),
                // Container(key: projectsKey, child: ProjectsSection()),
                Container(key: contactKey, child: ContactSection()),
                CopyRightSection(),
              ],
            ),
          ),

          // STICKY NAVBAR
          Positioned(top: 0, left: 0, right: 0,
            child: Column(
              children: [
                _navbar(),

                // Expandable Navbar in Mobile View
                _expandableNavbarMobileView(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// NAVBAR
  Widget _navbar() {
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          height: 90,
          padding: EdgeInsets.symmetric(horizontal: Responsive.scale(context, min: 6, max: 30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Krunal",
                style: GoogleFonts.lato(
                  fontSize: Responsive.scale(context, min: 8, max: 28),
                  fontWeight: FontWeight.bold,
                  color: AppColors.appWhiteColor,
                ),
              ),

              if (width >= 650)
                Row(
                  children: [
                    HeaderNavView(onTap: (index) => _handleTap(index)),
                    const SizedBox(width: 15,),

                    hireMeNavView(),
                  ],
                )
              else
                if (width > 100)
                  IconButton(
                  icon: Icon(
                    isMenuOpen ? Icons.close : Icons.menu,
                    color: AppColors.appWhiteColor,
                    size: Responsive.scale(context, min: width < 100 ? 8 : 15, max: 35),
                  ),
                  onPressed: () {
                    setState(() => isMenuOpen = !isMenuOpen);
                  },
                )
                else
                  SizedBox(),
            ],
          ),
        ),
      ),
    );
  }


  /// Expandable NavBar in Mobile View
  Widget _expandableNavbarMobileView(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isMenuOpen ? (width >= 650) ? 0 : Responsive.scale(context, min: 230, max: 370) : 0,
      width: double.infinity,
      child: ClipRect(
        child: Container(
          color: Color(0XFF111827),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _menuItem(title: "Home", index: 0),
              _menuItem(title: "Experience", index: 1),
              _menuItem(title: "Skills", index: 2),
              _menuItem(title: "Projects", index: 3),
              _menuItem(title: "Contact", index: 4),

              Column(
                children: [
                  Divider(color: AppColors.appWhiteColor.withValues(alpha: 0.3),),

                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: Responsive.scale(context, min: 3, max: 15)),
                    child: hireMeNavView(),
                  ),

                  Divider(color: AppColors.appWhiteColor.withValues(alpha: 0.3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Mobile View Menu Items
  Widget _menuItem({required String title, required int index}) {
    return InkWell(
      onTap: () {
        setState(() => isMenuOpen = false);
        selectedVIndex = index;
        _handleTap(index);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Responsive.scale(context, min: 7, max: 12),),
        decoration: BoxDecoration(
          color: selectedVIndex == index
              ? AppColors.cyanColor.shade300.withValues(alpha: 0.15)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: Responsive.scale(context, min: 20, max: 30),
              width: selectedVIndex == index ? 3 : 0,
              color: AppColors.cyanColor.shade900,
            ),

            SizedBox(width: Responsive.scale(context, min: 8, max: 35),),

            Text(
              title,
              style: GoogleFonts.lato(
                color: AppColors.appWhiteColor,
                fontSize: Responsive.scale(context, min: 6, max: 25),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hireMeNavView() {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => sendEmail(),
      child: Container(
        width: (width >= 650) ? 80 : double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: Responsive.scale(context, min: 6, max: 10),
          horizontal: Responsive.scale(context, min: 5, max: 12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Responsive.scale(context, min: 4, max: 8)),
          border: Border.all(color: AppColors.cyanColor.shade800, width: 1.0),
          color: AppColors.cyanColor.shade800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hire me",
              style: GoogleFonts.lato(
                fontSize: Responsive.scale(context, min: (width >= 650) ? 10 : 7, max: (width >= 650) ? 13 : 13),
                fontWeight: FontWeight.w800,
                color: AppColors.appWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(int index) {
    switch (index) {
      case 0:
        scrollToSection(homeKey);
        break;
      case 1:
        scrollToSection(experienceKey);
        break;
      case 2:
        scrollToSection(skillsKey);
        break;
      case 3:
        scrollToSection(projectsKey);
        break;
      case 4:
        scrollToSection(contactKey);
        break;
    }
  }
}

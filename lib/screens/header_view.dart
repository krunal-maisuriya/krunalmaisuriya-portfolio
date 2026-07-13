import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';
import 'package:krunal_portfolio/core/utils/helper/responsive.dart';
import 'package:krunal_portfolio/core/widgets/app_label_text/app_label_text_view.dart';

class HeaderNavView extends StatefulWidget {
  final Function(int) onTap;
  const HeaderNavView({super.key, required this.onTap});

  @override
  State<HeaderNavView> createState() => _HeaderNavViewState();
}

class _HeaderNavViewState extends State<HeaderNavView> {
  int selectedIndex = 0;
  final items = ["Home", "Experience", "Skills", "Projects", "Contact"];

  void onItemTap(int index) {
    setState(() => selectedIndex = index);
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    // Tablet/Desktop
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _menuItems(),
    );
  }


  List<Widget> _menuItems() {
    return List.generate(items.length, (index) {
      final isSelected = selectedIndex == index;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GestureDetector(
          onTap: () => onItemTap(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLabelTextView(
                items[index],
                fontSize: Responsive.scale(context, min: 12, max: 14),
                fontWeight: FontWeight.w700,
                textColor: AppColors.appWhiteColor,
              ),

              const SizedBox(height: 4),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: isSelected ? 25 : 0,
                color: AppColors.cyanColor.shade700,
              ),
            ],
          ),
        ),
      );
    });
  }
}
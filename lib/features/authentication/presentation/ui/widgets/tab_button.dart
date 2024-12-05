import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/core/utils/colors.dart';

class TabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.white : const Color(AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(text,
            style: AppTextStyles.bodyLarge.copyWith(
              color: isSelected
                  ? const Color(AppColors.primaryColor)
                  : Colors.white,
            )),
      ),
    );
  }
}

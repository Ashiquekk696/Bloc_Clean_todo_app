import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.isHomeAppBar = false,
      this.isAddTask = false})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isHomeAppBar;
  final bool isAddTask;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.0 - 10,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isAddTask
              ? const Color(AppColors.buttonColor)
              : isHomeAppBar
                  ? const Color(AppColors.white)
                  : const Color(AppColors.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(isAddTask || isHomeAppBar ? 20 : 15),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: AppTextStyles.bodyLarge.copyWith(
                    color: isHomeAppBar
                        ? const Color(AppColors.primaryColor)
                        : const Color(AppColors.white)),
              ),
      ),
    );
  }
}

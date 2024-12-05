import 'package:flutter/material.dart';
import 'package:todo_bloc_clean_app/core/utils/app_font_styles.dart';
import 'package:todo_bloc_clean_app/core/utils/colors.dart';
import 'package:todo_bloc_clean_app/core/utils/responive.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.responsive,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  final String label;
  final Responsive responsive;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator:validator ,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.bodyMedium.copyWith(color: const Color(AppColors.darkGrey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: EdgeInsets.symmetric(
            vertical: responsive.blockSizeVertical * 1.5,
            horizontal: responsive.isExtraSmallScreen()
                ? responsive.blockSizeHorizontal * 2
                : responsive.blockSizeHorizontal * 1,
          ),
        ),
      ),
    );
  }
}

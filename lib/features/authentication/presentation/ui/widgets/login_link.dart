
import 'package:flutter/material.dart';
import 'package:todo_bloc_clean_app/core/utils/app_font_styles.dart';
import 'package:todo_bloc_clean_app/core/utils/colors.dart';
import 'package:todo_bloc_clean_app/core/utils/constants.dart';

import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authBloc.add(ShowLoginEvent());
      },
      child: RichText(
        text: TextSpan(
          text: AppConstants.alreadyHaveAnAccount,
          style: AppTextStyles.headingMedium.copyWith(fontSize: 13),
          children: [
            TextSpan(
              text: AppConstants.login,
              style: AppTextStyles.headingMedium.copyWith(
                  fontSize: 13, color: const Color(AppColors.primaryColor)),
            ),
          ],
        ),
      ),
    );
  }
}

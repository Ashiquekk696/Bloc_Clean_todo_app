
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_clean_app/core/utils/app_font_styles.dart';
import 'package:todo_bloc_clean_app/core/utils/responive.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/ui/widgets/signup_form.dart';

import '../../../../../core/utils/colors.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final containerWidth = _getContainerWidth(responsive);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (BuildContext context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: responsive.blockSizeVertical * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sign Up Text above the box, aligned to the left
                Padding(
                  padding: EdgeInsets.only(
                      left: (responsive.width - containerWidth) / 2),
                  child: Text(
                    'Sign Up',
                    style: AppTextStyles.headingLarge
                        .copyWith(color: const Color(AppColors.primaryColor)),
                  ),
                ),
                SizedBox(height: responsive.blockSizeVertical * 1),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: containerWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(AppColors.primaryColor), width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(responsive.isExtraSmallScreen()
                        ? responsive.blockSizeHorizontal * 2
                        : responsive.blockSizeHorizontal * 1.5),
                    child: SignUpForm(authBloc: authBloc),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, AuthState state) {
          // Handle state changes if needed
        },
      ),
    );
  }

  double _getContainerWidth(Responsive responsive) {
    if (responsive.isExtraSmallScreen()) {
      return responsive.width * 0.9;
    } else if (responsive.isSmallScreen()) {
      return responsive.width * 0.8;
    } else if (responsive.isMediumScreen()) {
      return 400.0;
    } else if (responsive.isLargeScreen()) {
      return 450.0;
    } else {
      return responsive.width * 0.3;
    }
  }
}

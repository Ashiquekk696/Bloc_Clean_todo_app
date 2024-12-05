import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc_clean_app/core/utils/responive.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_state.dart';

import '../../../../../core/utils/app_font_styles.dart';
import '../../../../../core/utils/colors.dart';
import 'login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (BuildContext context, state) {
        final containerWidth = responsive.isExtraSmallScreen()
            ? responsive.width * 0.9
            : responsive.isSmallScreen()
                ? responsive.width * 0.8
                : responsive.isMediumScreen()
                    ? 400.0
                    : responsive.isLargeScreen()
                        ? 450.0
                        : responsive.width * 0.3;

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: responsive.blockSizeVertical * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(responsive, containerWidth),
                SizedBox(height: responsive.blockSizeVertical * 1),
                _buildLoginForm(responsive, containerWidth),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, AuthState state) {},
    );
  }

  Padding _buildHeader(Responsive responsive, double containerWidth) {
    return Padding(
      padding: EdgeInsets.only(left: (responsive.width - containerWidth) / 2),
      child: Text(
        'Login',
        style: AppTextStyles.headingLarge.copyWith(color: const Color(AppColors.primaryColor)),
      ),
    );
  }

  Align _buildLoginForm(Responsive responsive, double containerWidth) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(AppColors.primaryColor), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(responsive.isExtraSmallScreen()
            ? responsive.blockSizeHorizontal * 2
            : responsive.blockSizeHorizontal * 1.5),
        child: LoginFormWidget(authBloc: GetIt.I<AuthBloc>()),
      ),
    );
  }
}

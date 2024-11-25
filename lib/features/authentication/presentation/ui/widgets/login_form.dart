import 'package:flutter/material.dart';
import 'package:kinzy_todo_app/core/utils/app_font_styles.dart';
import 'package:kinzy_todo_app/core/utils/colors.dart';
import 'package:kinzy_todo_app/core/utils/responive.dart';
import 'package:kinzy_todo_app/core/widgets/textfield_widget.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/bloc/auth_event.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../bloc/auth_bloc.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Email',
            responsive: responsive,
            controller: emailController,
            validator: Validator.validateEmail,
          ),
          SizedBox(height: responsive.blockSizeVertical * 2),
          CustomTextField(
            label: 'Password',
            responsive: responsive,
            obscureText: true,
            controller: passwordController,
            validator: Validator.isRequired,
          ),
          SizedBox(height: responsive.blockSizeVertical * 2),
          CustomButton(
            text: AppConstants.login,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                authBloc.add(LoginEvent(email: emailController.text, password: passwordController.text));
              }
            },
          ),
          SizedBox(height: responsive.blockSizeVertical * 2),
          GestureDetector(
            onTap: () {
              authBloc.add(ShowRegisterEvent());
            },
            child: RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: AppTextStyles.headingMedium.copyWith(fontSize: 13),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: AppTextStyles.headingMedium.copyWith(
                        fontSize: 13, color: const Color(AppColors.primaryColor)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

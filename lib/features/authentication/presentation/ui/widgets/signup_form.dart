import 'package:flutter/material.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_event.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/responive.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/textfield_widget.dart';
import 'login_link.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'First Name',
            responsive: responsive,
            controller: firstNameController,
            validator: Validator.isRequired,
          ),
          CustomTextField(
            label: 'Last Name',
            responsive: responsive,
            controller: lastNameController,
            validator: Validator.isRequired,
          ),
          CustomTextField(
            label: 'Email',
            responsive: responsive,
            controller: emailController,
            validator: Validator.validateEmail,
          ),
          CustomTextField(
            label: 'Password',
            responsive: responsive,
            obscureText: false,
            controller: passwordController,
            validator: Validator.isRequired,
          ),
          CustomTextField(
            label: 'Confirm Password',
            responsive: responsive,
            obscureText: false,
            controller: confirmPasswordController,
            validator: (value) => Validator.validatePassword(
                passwordController.text, value),
          ),
          CustomButton(
            text: AppConstants.signUp,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                authBloc.add(SignUpEvent(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                ));
              }
            },
          ),
          LoginLink(authBloc: authBloc),
        ],
      ),
    );
  }
}
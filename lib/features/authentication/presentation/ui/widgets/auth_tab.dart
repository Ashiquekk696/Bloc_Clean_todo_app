import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_clean_app/core/utils/constants.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_event.dart';
import 'package:todo_bloc_clean_app/features/authentication/presentation/bloc/auth_state.dart';

import 'tab_button.dart';

class AuthTab extends StatelessWidget {
  const AuthTab({super.key, required this.authBloc});
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    // Retrieve AuthBloc from GetIt

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc, // Explicitly passing the BLoC from GetIt
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabButton(
              text: AppConstants.login,
              isSelected: state.isLoginSelected,
              onTap: () {
                authBloc.add(ShowLoginEvent());
              },
            ),
            const SizedBox(width: 10),
            TabButton(
              text: AppConstants.signUp,
              isSelected: !state.isLoginSelected,
              onTap: () {
                authBloc.add(ShowRegisterEvent());
              },
            ),
          ],
        );
      },
    );
  }
}

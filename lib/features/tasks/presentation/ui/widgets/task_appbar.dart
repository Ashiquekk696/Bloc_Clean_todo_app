
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/core/widgets/app_button.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/bloc/auth_bloc.dart';

import '../../../../authentication/presentation/bloc/auth_event.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    AuthBloc authBloc = GetIt.I<AuthBloc>();
    return Row(
      children: [const Spacer(),
        SizedBox(
          width: 100,
          child: CustomButton(
            isHomeAppBar: true,
            onPressed: (){
            authBloc.add(LogOutEvent());
            }, text: "Logout",)),
        const SizedBox(width: 50,)
      ],
    );
  }
}

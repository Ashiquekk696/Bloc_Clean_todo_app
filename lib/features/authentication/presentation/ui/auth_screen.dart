import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kinzy_todo_app/core/utils/colors.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/bloc/auth_state.dart';
import 'package:kinzy_todo_app/features/authentication/presentation/ui/widgets/auth_tab.dart';

import 'widgets/login_widget.dart';
import 'widgets/signup_widget.dart';
 
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState(); 
    _authBloc = GetIt.I<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(AppColors.primaryColor),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.task, color: Colors.white), // ToDo Icon
        ),
        title:   AuthTab(authBloc: _authBloc,),
        centerTitle: false,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: _authBloc,  
        builder: (context, state) {
      
          if (state.isLoginSelected) {
            return   LoginView(authBloc: _authBloc,);
          } else {
            return    SignUpView(authBloc: _authBloc,);  
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose(); 
  }
}

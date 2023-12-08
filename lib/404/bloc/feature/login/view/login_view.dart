// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/202/lesson4/image_learn.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/vexana_network_manager.dart';
import 'package:kartal/kartal.dart';

part 'login_view_items.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';

  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(
                      color: context.general.colorScheme.scrim)
                  : const SizedBox.shrink();
            },
          ),
        ),
        body: Form(
            key: _formLoginKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const MyPadding.all(),
              child: Column(
                children: [
                  _LoginFields(
                    email: _emailController,
                    password: _passwordController,
                  ),
                  _LoginButton(
                      formLoginKey: _formLoginKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      loginText: _loginText),
                ],
              ),
            )),
      ),
    );
  }
}

class MyPadding extends EdgeInsets {
  const MyPadding.all() : super.all(20);
  const MyPadding.bottom() : super.only(bottom: 20);
}

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson3/widget/password_text_field.dart';

class PasswordLearnView extends StatefulWidget {
  const PasswordLearnView({super.key});

  @override
  State<PasswordLearnView> createState() => _PasswordLearnViewState();
}

class _PasswordLearnViewState extends State<PasswordLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(children: [
        PasswordTextField(),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson1/generic_learn.dart';

class GenericUserCard extends StatelessWidget {
  const GenericUserCard({super.key, required this.model});
  final GenericUser model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(model.name),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson3/widget_size_enum.dart';

class EnumLearnView extends StatefulWidget {
  const EnumLearnView({super.key});

  @override
  State<EnumLearnView> createState() => _EnumLearnViewState();
}

class _EnumLearnViewState extends State<EnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          color: Colors.red,
          height: WidgetSizes.normalCardHeight.value(),
        ),
      ),
    );
  }
}

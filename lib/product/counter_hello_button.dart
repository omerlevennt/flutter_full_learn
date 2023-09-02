import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  // final String hello = 'merhaba';
  void _updateValue() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _updateValue();
        },
        child: Text('${LanguageItems.welcomeTitle} $_counterCustom'));
  }
}

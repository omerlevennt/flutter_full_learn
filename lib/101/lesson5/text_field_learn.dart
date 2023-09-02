import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final FocusNode _focusNodeOne = FocusNode();
  final FocusNode _focusNodeTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            focusNode: _focusNodeOne,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [TextProjectInputFormatter()._formatter],
            //maxLength: 20,
            buildCounter: (context,
                    {int? currentLength, bool? isFocused, int? maxLength}) =>
                _animatedContainer(currentLength),
            decoration: _InputDecarator().eMailInput,
          ),
          TextField(
            minLines: 4,
            maxLines: 8,
            focusNode: _focusNodeTwo,
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
        duration: const Duration(microseconds: 100),
        height: 10,
        width: 10.0 * (currentLength ?? 0),
        color: Colors.red //[50 * ((currentLength ?? 0) ~/ 2)],
        );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (oldValue.text == 'a') {
      return oldValue;
    }
    return oldValue;
  });
}

class _InputDecarator {
  final eMailInput = const InputDecoration(
      filled: true,
      fillColor: Colors.grey,
      labelText: LanguageItems.mail,
      prefixIcon: Icon(Icons.mail),
      border: OutlineInputBorder());
}

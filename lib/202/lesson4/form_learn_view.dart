import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {},
          child: Column(
            children: [
              TextFormField(
                validator: FormFieldValidator().isNotEmpty,
              ),
              TextFormField(
                validator: FormFieldValidator().isNotEmpty,
              ),
              DropdownButtonFormField<String>(
                value: 'v',
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(
                    value: 'v',
                    child: Text('data'),
                  ),
                  DropdownMenuItem(
                    value: 'v1',
                    child: Text('data'),
                  ),
                  DropdownMenuItem(
                    value: 'v2',
                    child: Text('data'),
                  ),
                ],
                onChanged: (value) {},
              ),
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState?.validate() ?? false) {
                      print('okey');
                    }
                  },
                  child: const Text('SAVE'))
            ],
          ),
        ));
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false)
        ? null
        : ValidatorMessage._notEmptyMessage;
  }
}

class ValidatorMessage {
  static const String _notEmptyMessage = 'Bu alan bos gecilemez';
}

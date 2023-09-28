import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson2/service/post_model.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({super.key});

  @override
  State<ServicePostLearnView> createState() => _ServicePostLearnViewState();
}

class _ServicePostLearnViewState extends State<ServicePostLearnView> {
  late final Dio _networkManager;
  late final name;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  bool _isLoading = false;
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _bodyEditingController = TextEditingController();
  final TextEditingController _usrIdEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    name = 'omer';
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _networkManager.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(children: [
        TextField(
          controller: _titleEditingController,
          decoration: const InputDecoration(labelText: 'Title'),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        TextField(
          controller: _bodyEditingController,
          decoration: const InputDecoration(labelText: 'Body'),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        TextField(
          controller: _usrIdEditingController,
          keyboardType: TextInputType.phone,
          autofillHints: const [AutofillHints.creditCardNumber],
          decoration: const InputDecoration(labelText: 'User id'),
          textInputAction: TextInputAction.done,
        ),
        TextButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleEditingController.text.isNotEmpty &&
                        _bodyEditingController.text.isNotEmpty &&
                        _usrIdEditingController.text.isNotEmpty) {
                      final model = PostModel(
                        body: _bodyEditingController.text,
                        title: _titleEditingController.text,
                        userId: int.tryParse(_usrIdEditingController.text),
                      );

                      _addItemToService(model);
                    }
                  },
            child: const Text('Send'))
      ]),
    );
  }
}

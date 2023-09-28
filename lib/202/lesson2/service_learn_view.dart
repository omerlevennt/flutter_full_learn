import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson2/comments_learn_view.dart';
import 'package:flutter_full_learn/202/lesson2/service/post_model.dart';
import 'package:flutter_full_learn/202/lesson2/service/post_service.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({super.key});

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  List<PostModel>? _items; //Bu data gelmeyebilir diyorum
  String? name;
  late final Dio _networkManager;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  late final PostService _postService;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    name = 'Omer';
    //fetchPostItems();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  // Future<void> fetchPostItems() async {
  //   _changeLoading();
  //   final response =
  //       await Dio().get('https://jsonplaceholder.typicode.com/posts');

  //   if (response.statusCode == HttpStatus.ok) {
  //     final _datas = response.data;

  //     if (_datas is List) {
  //       setState(() {
  //         _items = _datas.map((e) => PostModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    final response = await _networkManager.get('posts');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
        title: Text(name ?? ''),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return CommentsLearnView(
                postId: _model?.id,
              );
            },
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}

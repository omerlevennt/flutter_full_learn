import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson2/service/post_model.dart';
import 'package:flutter_full_learn/202/lesson2/service/post_service.dart';

class ServiceAdvenceLearnView extends StatefulWidget {
  const ServiceAdvenceLearnView({super.key});

  @override
  State<ServiceAdvenceLearnView> createState() =>
      _ServiceAdvenceLearnViewState();
}

class _ServiceAdvenceLearnViewState extends State<ServiceAdvenceLearnView> {
  List<PostModel>? _items; //Bu data gelmeyebilir diyorum
  String? name;

//Test Edilebilir kod basladi
  late final IPostService _postService;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchPostItemsAdvance();
    name = 'Omer';
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
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
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
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
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}

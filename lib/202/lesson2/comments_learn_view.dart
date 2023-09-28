import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson2/service/comment_model.dart';
import 'package:flutter_full_learn/202/lesson2/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({super.key, this.postId});
  final int? postId;
  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService postService;
  bool _isLoading = false;

  List<CommentModel>? _commnetsItem;
  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
    _commnetsItem = await postService.fetchRelatedCommentsWhitPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commnetsItem?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(_commnetsItem?[index].email ?? ''),
          );
        },
      ),
    );
  }
}

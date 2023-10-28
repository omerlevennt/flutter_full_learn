import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/viewModel/reqres_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading
            ? const CircularProgressIndicator()
            : const SizedBox.shrink(),
      ),
      body: ListView.builder(
        itemCount: resourses.length,
        itemBuilder: (context, index) {
          return Text(resourses[index].name ?? '');
        },
      ),
    );
  }
}

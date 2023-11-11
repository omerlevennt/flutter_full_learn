import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  const NavigateHomeDetail({super.key, this.id});
  final String? id;

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;
  @override
  void initState() {
    super.initState();

    _id = widget.id;
    if (_id == null) {
      Future.microtask(() {
        final modelId = ModalRoute.of(context)?.settings.arguments;
        // if (modelId is String) {
        //   _id = modelId;
        // }
        setState(() {
          _id = modelId is String ? modelId : widget.id;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}

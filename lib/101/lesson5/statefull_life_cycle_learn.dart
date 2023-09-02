import 'package:flutter/material.dart';

class StateFullLifeCycleLearn extends StatefulWidget {
  const StateFullLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StateFullLifeCycleLearn> createState() =>
      _StateFullLifeCycleLearnState();
}

class _StateFullLifeCycleLearnState extends State<StateFullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StateFullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _message = '';
  }

  @override
  void initState() {
    super.initState();
    _isOdd = widget.message.length.isOdd;
    _message = widget.message;
    _computeName();
  }

  void _computeName() {
    if (_isOdd) {
      _message += ' cift';
    } else {
      _message += ' tek';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_message),
        ),
        body: _isOdd
            ? TextButton(onPressed: () {}, child: Text(widget.message))
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    _message = 'a';
                  });
                },
                child: Text(widget.message)));
  }
}

import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final Future<void> Function() onPressed;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  final bool _isLoading = false;

  void _changeLoading() {
    setState(
      () {
        _isLoading != _isLoading;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          if (_isLoading) return;

          _changeLoading();
          await widget.onPressed.call();
          _changeLoading();
        },
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : Text(widget.title),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson3/package/lauch_manager_mixin.dart';
import 'package:flutter_full_learn/202/lesson3/package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
          // launchURL('x');
        },
      ),
      appBar: AppBar(),
      body: const LoadingBar(
        size: 30,
      ),
    );
  }

  @override
  void name() {}
}

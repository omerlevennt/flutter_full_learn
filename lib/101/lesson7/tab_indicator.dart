import 'package:flutter/material.dart';

class TabIndicatorLearn extends StatefulWidget {
  const TabIndicatorLearn({Key? key}) : super(key: key);

  @override
  State<TabIndicatorLearn> createState() => _TabIndicatorLearnState();
}

class _TabIndicatorLearnState extends State<TabIndicatorLearn>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabPageSelector Örneği'),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Center(child: Text('Sayfa 1')),
          Center(child: Text('Sayfa 2')),
          Center(child: Text('Sayfa 3')),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: TabPageSelector(
          controller: _controller,
          color: Colors.black38,
          selectedColor: Colors.white30,
        ),
      ),
    );
  }
}

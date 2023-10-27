import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/lesson2/icon_learn.dart';
import 'package:flutter_full_learn/202/lesson4/image_learn.dart';
import 'package:flutter_full_learn/303/lesson2/feed_view.dart';

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({super.key});

  @override
  State<TabbarAdvanceLearn> createState() => _TabbarAdvanceLearnState();
}

class _TabbarAdvanceLearnState extends State<TabbarAdvanceLearn>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMarginValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchMarginValue,
          shape: const CircularNotchedRectangle(),
          child: _myTabView(),
        ),
        // appBar: AppBar(
        //     bottom: TabBar(controller: _tabController, tabs: const [
        //   Tab(text: 'Page1'),
        //   Tab(text: 'Page2'),
        // ])),
        body: _tabBarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        // isScrollable: true,
        padding: EdgeInsets.zero,
        // labelColor: Colors.yellow,
        // unselectedLabelColor: Colors.green,
        indicatorColor: Colors.white,
        controller: _tabController,
        // indicatorSize: TabBarIndicatorSize.label,
        onTap: (value) {},
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          const FeedView(),
          IconLearn(),
          const ImageLearn(),
          IconLearn()
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

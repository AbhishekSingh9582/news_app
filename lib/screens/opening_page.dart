// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/categories.dart';
import '../provider/theme_model.dart';
import '../provider/article_provider.dart';
import 'categories_pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;
  List<Tab> tabList = [];
  @override
  void initState() {
    super.initState();
    tabList = Provider.of<Categories>(context, listen: false).listTab;
    _tabController = TabController(length: tabList.length, vsync: this);
    _scrollController = ScrollController();
    _tabController!.addListener(smoothScrollToTop);
  }

  void smoothScrollToTop() {
    if (_scrollController!.hasClients) {
      _scrollController!.animateTo(0,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
    _scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeNotifier, _) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          controller: _scrollController,
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              title: const Text(
                'NewsHunt',
              ),
              elevation: 0,
              actions: [
                IconButton(
                    icon: Icon(themeNotifier.isDark
                        ? Icons.wb_sunny
                        : Icons.nightlight_round),
                    onPressed: () {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    })
              ],
              pinned: true,
              floating: true,
              centerTitle: true,
              snap: true,
              bottom: TabBar(
                  labelPadding: const EdgeInsets.only(right: 13, left: 2),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                    width: 2.5,
                    color: themeNotifier.isDark ? Colors.white : Colors.black,
                  )),
                  labelColor:
                      themeNotifier.isDark ? Colors.white : Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                  unselectedLabelColor:
                      themeNotifier.isDark ? Colors.white70 : Colors.black45,
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal),
                  tabs: tabList),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              CategoriesPages(''),
              CategoriesPages('technology'),
              CategoriesPages('business'),
              CategoriesPages('entertainment'),
              CategoriesPages('sport'),
              CategoriesPages('health'),
              CategoriesPages('science'),
            ],
          ),
        ),
      ),
    );
  }

  // SliverToBoxAdapter(
  //   child: Container(
  //     padding: const EdgeInsets.only(left: 25),
  //     alignment: Alignment.centerLeft,
  //     child: TabBar(
  //         labelPadding: const EdgeInsets.only(right: 15),
  //         indicatorSize: TabBarIndicatorSize.label,
  //         controller: _tabController,
  //         isScrollable: true,
  //         indicator: const UnderlineTabIndicator(
  //             borderSide: BorderSide(
  //           color: Colors.black,
  //         )),
  //         labelColor: Colors.black,
  //         labelStyle: const TextStyle(
  //             fontSize: 19, fontWeight: FontWeight.bold),
  //         unselectedLabelColor: Colors.black45,
  //         unselectedLabelStyle: const TextStyle(
  //             fontSize: 18, fontWeight: FontWeight.normal),
  //         tabs: tabList),
  //   ),
  // ),

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         'NewsHunt',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       elevation: 0,
  //       backgroundColor: Colors.transparent,
  //       bottom: TabBar(
  //           labelPadding: const EdgeInsets.only(right: 15),
  //           indicatorSize: TabBarIndicatorSize.label,
  //           controller: _tabController,
  //           isScrollable: true,
  //           indicator: const UnderlineTabIndicator(
  //               borderSide: BorderSide(
  //             color: Colors.black,
  //           )),
  //           labelColor: Colors.black,
  //           labelStyle:
  //               const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
  //           unselectedLabelColor: Colors.black45,
  //           unselectedLabelStyle:
  //               const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
  //           tabs: tabList),
  //     ),
  //     body: TabBarView(
  //       physics: const ClampingScrollPhysics(),
  //       controller: _tabController,
  //       children: const <Widget>[
  //         CategoriesPages(''),
  //         CategoriesPages('technology'),
  //         CategoriesPages('business'),
  //         CategoriesPages('entertainment'),
  //         CategoriesPages('sport'),
  //         CategoriesPages('health'),
  //         CategoriesPages('science'),
  //       ],
  //     ),
  //   );
  //}
}

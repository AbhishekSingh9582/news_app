import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/categories.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NewsHunt',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) => [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 15),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal),
                  tabs: tabList),
            ),
          ),
          // TabBar(
          //   // isScrollable: true,
          //   indicatorWeight: 2.0,
          //   physics:
          //       const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          //   indicatorSize: TabBarIndicatorSize.label,
          //   unselectedLabelColor: Colors.grey,
          //   //indicator: BoxDecoration(),
          //   indicatorColor: Colors.grey,
          //   controller: _tabController,
          //   tabs: tabList,
          // ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              height: 120,
              child: Text("1"),
            ),
            Container(
              height: 121,
              child: Text("2"),
            ),
            Container(
              height: 122,
              child: Text("3"),
            ),
            Container(
              height: 123,
              child: Text("4"),
            ),
            Container(
              height: 124,
              child: Text("5"),
            ),
            Container(
              height: 125,
              child: Text("6"),
            ),
            Container(
              height: 125,
              child: Text("7"),
            ),
          ],
        ),
      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   List<Tab> tabList = [];
//   @override
//   void initState() {
   
//     super.initState();
//     tabList = Provider.of<Categories>(context, listen: false).listTab;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabList.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'NewsHunt',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           bottom: TabBar(
//               indicatorColor: Colors.black,
//               unselectedLabelColor: Colors.black.withOpacity(0.5),
//               isScrollable: true,
//               tabs: tabList),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             Container(
//               height: 120,
//               child: Text("1"),
//             ),
//             Container(
//               height: 121,
//               child: Text("2"),
//             ),
//             Container(
//               height: 122,
//               child: Text("3"),
//             ),
//             Container(
//               height: 123,
//               child: Text("4"),
//             ),
//             Container(
//               height: 124,
//               child: Text("5"),
//             ),
//             Container(
//               height: 125,
//               child: Text("6"),
//             ),
//             Container(
//               height: 125,
//               child: Text("7"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

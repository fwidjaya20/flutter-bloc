import 'package:bloc_test/commons/models/tab_bars/tab_bar.dart';
import 'package:bloc_test/styles/colors.dart';
import 'package:flutter/material.dart';

class TopTabBar extends StatefulWidget {
  
  final TabBarModel data;
  
  TopTabBar({
    @required this.data
  });

  @override
  State<StatefulWidget> createState() {
    return _TopTabBarState();
  }

}

class _TopTabBarState extends State<TopTabBar> with TickerProviderStateMixin {

  TabController _tabController;
  List<Tab> _tabHeaders;
  List<Widget> _tabBodies;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabHeaders = _generateTabHeaders();
    _tabBodies = _generateTabBodies();

    _tabController = TabController(
      length: _tabHeaders.length,
      initialIndex: _selectedTabIndex,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: MediaQuery.of(context).size.width,
          child:  Text(widget.data.title,
            style: TextStyle(
              fontSize: 20.0,
              color: BaseColor.txtWhite
            ),
            textAlign: TextAlign.center
          )
        ),
        bottom: TabBar(
          onTap: _handleTabBarClicked,
          controller: _tabController,
          tabs: _tabHeaders,
          labelColor: BaseColor.txtBlack,
          labelStyle: TextStyle(
            color: BaseColor.txtBlack,
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelColor: BaseColor.unselectedColorWhite1,
          indicatorColor: BaseColor.bgWhite,
        ),
      ),
      body: _tabBodies[_selectedTabIndex],
    );
  }

  List<Tab> _generateTabHeaders() {
    return widget.data.tabItems.map((item) {
      return Tab(
        text: item.title,
      );
    }).toList();
  }

  List<Widget> _generateTabBodies() {
    return widget.data.tabItems.map((item) {
      return item.body;
    }).toList();
  }

  void _handleTabBarClicked(int index) {
    if (_selectedTabIndex != index) {
      setState(() {
        _selectedTabIndex = index;
      });
    }
  }

}

import 'package:flutter/material.dart';
import 'package:techify_assesment/constant/color_constant.dart';
import 'package:techify_assesment/constant/global_variable.dart';
import 'package:techify_assesment/ui/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: GlobalVariable.tabTexts.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: DefaultTabController(
        length: _tabController.length,
        child: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: GlobalVariable.tabTexts.map((e) => const NewsScreen()).toList(),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 4,
      bottom: TabBar(
        indicatorColor: ColorConst.tabColor,
        indicatorWeight: 3,
        labelColor: ColorConst.tabColor,
        controller: _tabController,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        tabs: GlobalVariable.tabTexts.map((e) => _tabs(e)).toList(),
      ),
      title: const Text(
        "OXUZ.aZ",
        style: TextStyle(
          fontSize: 22,
          color: ColorConst.black,
        ),
      ),
    );
  }

  Tab _tabs(String text) {
    return Tab(
      text: text,
    );
  }
}

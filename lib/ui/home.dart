import 'package:flutter/material.dart';
import 'package:techify_assesment/bloc/bookmark_bloc.dart';
import 'package:techify_assesment/bloc/bottom_bar_bloc.dart';
import 'package:techify_assesment/constant/color_constant.dart';
import 'package:techify_assesment/constant/global_variable.dart';
import 'package:techify_assesment/model/response/news_response.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late BottomBarBloc _bottomBarBloc;
  late BookmarkBloc _bookmarkBloc;

  @override
  void initState() {
    super.initState();
    _bottomBarBloc = BottomBarBloc();
    _bookmarkBloc = BookmarkBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBarBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StreamBuilder<int>(
        stream: _bottomBarBloc.selectedIndex,
        builder: (context, snapshot) {
          final selectedIndex = snapshot.data ?? 0;
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: GlobalVariable.bottomNavigationBarImage
                .asMap()
                .map(
                  (index, e) => MapEntry(
                    index,
                    BottomNavigationBarItem(
                      label: "",
                      icon: index == 2
                          ? StreamBuilder<List<Articles>>(
                              stream: _bookmarkBloc.bookMarkList,
                              builder: (context, snapshot) {
                                final data = snapshot.data?.length ?? 0;
                                return Badge(
                                    largeSize: 20,
                                    isLabelVisible: data > 0 ? true : false,
                                    backgroundColor: ColorConst.tabColor,
                                    alignment: AlignmentDirectional.topEnd,
                                    label: Text(
                                      data.toString(),
                                    ),
                                    child: Icon(e));
                              })
                          : Icon(e),
                      backgroundColor: Colors.green,
                    ),
                  ),
                )
                .values
                .toList(),
            currentIndex: selectedIndex,
            selectedItemColor: ColorConst.tabColor,
            iconSize: 40,
            onTap: (index) => _bottomBarBloc.onBottomBarTap(index),
            elevation: 5,
          );
        },
      ),
      body: StreamBuilder<int>(
        initialData: 0,
        stream: _bottomBarBloc.selectedIndex,
        builder: (context, snapshot) => GlobalVariable.bottomBarScreen().elementAt(snapshot.data!),
      ),
    );
  }
}

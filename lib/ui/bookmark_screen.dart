import 'package:flutter/material.dart';
import 'package:techify_assesment/bloc/bookmark_bloc.dart';
import 'package:techify_assesment/constant/color_constant.dart';
import 'package:techify_assesment/model/response/news_response.dart';
import 'package:techify_assesment/widget/news_tile.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen({Key? key}) : super(key: key);

  final bookmarkBloc = BookmarkBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bookmark",
          style: TextStyle(color: ColorConst.black),
        ),
      ),
      body: StreamBuilder<List<Articles>>(
        stream: bookmarkBloc.bookMarkList,
        builder: (context, snapshot) {
          final bookmarkList = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: bookmarkList.length,
            itemBuilder: (context, index) {
              return NewsTile(
                articles: bookmarkList[index],
                bookmarkBloc: bookmarkBloc,
              );
            },
          );
        },
      ),
    );
  }
}

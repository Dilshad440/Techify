import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:techify_assesment/base/base_bloc/base_bloc.dart';
import 'package:techify_assesment/model/response/news_response.dart';
import 'package:techify_assesment/utility/app_utility.dart';

class BookmarkBloc extends BaseBloc {
  static final _instance = BookmarkBloc._internal();

  BookmarkBloc._internal();

  factory BookmarkBloc() {
    return _instance;
  }

  final bookMarkList = BehaviorSubject<List<Articles>>();
  final List<Articles> articleList = [];

  void addToBookMark(Articles articles, BuildContext context) {
    final bookMark = bookMarkList.valueOrNull;
    if (bookMark != null) {
      final alreadyInBookMark = bookMark.any((e) => e.description == articles.description);
      if (!alreadyInBookMark) {
        articleList.add(articles);
        bookMarkList.add(articleList);
        AppUtility.showInSnackBar(msg: "Items added in bookmark", context: context);
      } else {
        AppUtility.showInSnackBar(msg: "Items already in bookmark", context: context);
      }
    } else {
      articleList.add(articles);
      bookMarkList.add(articleList);
      AppUtility.showInSnackBar(msg: "Items added in bookmark", context: context);
    }
  }

  @override
  void dispose() {
    subscriptions.cancel();
    bookMarkList.close();
    super.dispose();
  }
}

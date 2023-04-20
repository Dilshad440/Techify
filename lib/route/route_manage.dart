import 'package:flutter/material.dart';
import 'package:techify_assesment/model/response/news_response.dart';
import 'package:techify_assesment/route/route_constant.dart';
import 'package:techify_assesment/ui/news_detail_screen.dart';

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.detailScreen:
        final newsDetail = settings.arguments as Articles;
        return MaterialPageRoute(
          builder: (context) => NewsDetailScreen(articles: newsDetail),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('404!!'),
        ),
      ),
    );
  }
}

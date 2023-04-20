import 'package:techify_assesment/model/response/news_response.dart';

class NewsData {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsData({this.status, this.totalResults, this.articles});
}

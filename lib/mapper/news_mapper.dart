import 'package:techify_assesment/base/base_bloc/base_mapper.dart';
import 'package:techify_assesment/model/response/news_response.dart';

class NewsMapper extends BaseMapper<NewsResponse, List<Articles>> {
  @override
  List<Articles> map(NewsResponse v) {
    return v.articles
        .map((e) => Articles(
              title: e.title,
              description: e.description,
              author: e.author,
              content: e.content,
              publishedAt: e.publishedAt,
              source: e.source,
              url: e.url,
              urlToImage: e.urlToImage,
            ))
        .toList();
  }
}

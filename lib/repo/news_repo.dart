import 'package:techify_assesment/mapper/news_mapper.dart';
import 'package:techify_assesment/model/response/news_response.dart';
import 'package:techify_assesment/source/api_source.dart';

class NewsRepo {
  final _apiSource = ApiSource();
  final _newsMapper = NewsMapper();

  Stream<List<Articles>> fetchNews() {
    return _apiSource.fetchNews().map((event) => _newsMapper.map(event));
  }
}

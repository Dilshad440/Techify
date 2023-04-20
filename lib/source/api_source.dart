import 'package:techify_assesment/base/configuration/rest_client.dart';
import 'package:techify_assesment/model/response/news_response.dart';

class ApiSource {
  final _restClient = RestClient();

  Stream<NewsResponse> fetchNews() {
    return Stream.fromFuture(
      _restClient.dio.get(
        '/top-headlines',
        queryParameters: {
          'sources': 'techcrunch',
        },
      ),
    ).map((event) => NewsResponse.fromJson(event.data));
  }
}

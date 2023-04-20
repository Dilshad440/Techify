import 'package:techify_assesment/base/base_bloc/base_ui_state.dart';
import 'package:techify_assesment/model/response/news_response.dart';

class NewsState extends BaseUiState<List<Articles>> {
  NewsState.loading() : super.loading();

  NewsState.completed(List<Articles> data) : super.completed(data: data);

  NewsState.error(dynamic error) : super.error(error);
}

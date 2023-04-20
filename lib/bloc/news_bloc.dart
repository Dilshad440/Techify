import 'package:rxdart/rxdart.dart';
import 'package:techify_assesment/base/base_bloc/base_bloc.dart';
import 'package:techify_assesment/repo/news_repo.dart';
import 'package:techify_assesment/state/news_state.dart';

class NewsBloc extends BaseBloc {
  final sliderIndex = BehaviorSubject.seeded(0);
  final newsState = BehaviorSubject<NewsState>();
  final _newsRepo = NewsRepo();

  void fetchNews() {
    subscriptions.add(
      _newsRepo
          .fetchNews()
          .map((event) => NewsState.completed(event))
          .startWith(NewsState.loading())
          .onErrorReturnWith((error, stackTrace) => NewsState.error(error))
          .listen(
        (event) {
          newsState.add(event);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscriptions.clear();
    sliderIndex.close();
    newsState.close();
  }
}

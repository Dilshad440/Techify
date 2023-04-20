import 'package:rxdart/rxdart.dart';
import 'package:techify_assesment/base/base_bloc/base_bloc.dart';

class BottomBarBloc extends BaseBloc {
  final selectedIndex = BehaviorSubject.seeded(0);

  void onBottomBarTap(int index) {
    selectedIndex.add(index);
  }

  @override
  void dispose() {
    subscriptions.cancel();
    selectedIndex.close();
  }
}

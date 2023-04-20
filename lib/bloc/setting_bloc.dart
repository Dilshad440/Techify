import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techify_assesment/base/base_bloc/base_bloc.dart';

class SettingBloc extends BaseBloc {
  static final _instance = SettingBloc._internal();

  SettingBloc._internal();

  factory SettingBloc() {
    return _instance;
  }

  final isDark = BehaviorSubject.seeded(false);

  Future<void> checkPlatformMode() async {
    final prefs = await SharedPreferences.getInstance();
    final getModeFromLocal = prefs.getBool('isDark');
    if (getModeFromLocal == null) {
      final platform = WidgetsBinding.instance.window.platformBrightness;
      if (platform == Brightness.dark) {
        await prefs.setBool('isDark', true);
        isDark.add(true);
      }
    } else {
      isDark.add(getModeFromLocal);
    }
  }

  Future<void> switchToDark(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', value);
    isDark.add(value);
  }
}

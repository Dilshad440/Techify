import 'package:flutter/material.dart';
import 'package:techify_assesment/base/theme/app_theme.dart';
import 'package:techify_assesment/bloc/setting_bloc.dart';
import 'package:techify_assesment/route/route_constant.dart';
import 'package:techify_assesment/route/route_manage.dart';
import 'package:techify_assesment/ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SettingBloc _settingBloc;
  @override
  void initState() {
    super.initState();
    _settingBloc = SettingBloc();
    _settingBloc.checkPlatformMode();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _settingBloc.isDark,
      builder: (context, snapshot) {
        return MaterialApp(
          initialRoute: RouteConstant.initialRoute,
          onGenerateRoute: RouteManager.onGenerateRoute,
          title: 'Flutter Demo',
          theme: snapshot.data == true ? ThemeData.dark() : AppTheme.getTheme(),
          home: const Home(),
        );
      },
    );
  }
}

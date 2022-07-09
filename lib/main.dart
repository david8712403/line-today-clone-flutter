import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:line_today_clone/component/dialogs.dart';
import 'package:line_today_clone/screen/home_screen.dart';
import 'package:line_today_clone/service/news_service.dart';
import 'package:line_today_clone/util/constant.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  await dotenv.load(fileName: "config/.env");
  await NewsService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      theme: ThemeData(primarySwatch: MColor.PRIMARY_COLOR),
      locale: _locale,
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/',
      home: const RootWidget(),
      routes: <String, WidgetBuilder>{},
    );
  }
}

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  @override
  void initState() {
    NewsService.instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: ((options, handler) {
          if (mounted) {
            setState(() {});
          }
          return handler.next(options);
        }),
        onError: (e, handler) {
          if (mounted) {
            setState(() {});
          }
          showDialog(
            context: context,
            builder: (x) => MAlertDialog(error: e),
          );
        },
        onResponse: (response, handler) {
          if (mounted) {
            setState(() {});
          }
          return handler.next(response);
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

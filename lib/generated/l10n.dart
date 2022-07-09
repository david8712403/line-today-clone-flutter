// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LINE TODAY 克隆`
  String get app_name {
    return Intl.message(
      'LINE TODAY 克隆',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `商業`
  String get business {
    return Intl.message(
      '商業',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `娛樂`
  String get entertainment {
    return Intl.message(
      '娛樂',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `一般`
  String get general {
    return Intl.message(
      '一般',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `健康`
  String get health {
    return Intl.message(
      '健康',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `科學`
  String get science {
    return Intl.message(
      '科學',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `運動`
  String get sports {
    return Intl.message(
      '運動',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `科技`
  String get technology {
    return Intl.message(
      '科技',
      name: 'technology',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

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

  /// `HomePage`
  String get homePage {
    return Intl.message(
      'HomePage',
      name: 'homePage',
      desc: 'this is a home page',
      args: [],
    );
  }

  /// `Ask Doubt`
  String get askDoubt {
    return Intl.message(
      'Ask Doubt',
      name: 'askDoubt',
      desc: 'Drawer',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: 'The conventional newborn programmer greeLanguages',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message(
      'Rate Us',
      name: 'rateUs',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `I am`
  String get iAm {
    return Intl.message(
      'I am',
      name: 'iAm',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Application Status`
  String get applicationStatus {
    return Intl.message(
      'Application Status',
      name: 'applicationStatus',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message(
      'Rejected',
      name: 'rejected',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `New Application`
  String get newApplication {
    return Intl.message(
      'New Application',
      name: 'newApplication',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Apply Now`
  String get applyNow {
    return Intl.message(
      'Apply Now',
      name: 'applyNow',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message(
      'Home Screen',
      name: 'homeScreen',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Make A Call`
  String get makeACall {
    return Intl.message(
      'Make A Call',
      name: 'makeACall',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Sign In With Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In With Google',
      name: 'signInWithGoogle',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Admin Login`
  String get adminLogin {
    return Intl.message(
      'Admin Login',
      name: 'adminLogin',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `No Application Fount`
  String get noApplicationFount {
    return Intl.message(
      'No Application Fount',
      name: 'noApplicationFount',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ml'),
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

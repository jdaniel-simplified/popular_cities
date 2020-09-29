///
//
/// @About:     Main App file
// @File:       main.dart
// @Date:       09-28-20
// @Version:    popular_cities 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:popular_cities/blocs/simple_bloc_delegate.dart';
import 'package:popular_cities/repositories/preferences_repository.dart';
import 'package:popular_cities/widgets/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/preferences_bloc/preferences_bloc.dart';

void main()
{
  // ignore: invalid_use_of_visible_for_testing_member
  //SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocDelegate();
  //print(FirebaseHelper.shared.getToken());
  final preferences = PreferencesImpl();

  final preferencesBloc = PreferencesBloc(preferences: preferences);

  preferencesBloc
      .firstWhere((state) => state is PreferencesLoaded)
      .then((_) => runApp(App(
      prefs: preferences,
      preferencesBloc: preferencesBloc
  )));


  preferencesBloc.add(LoadPreferences());

}
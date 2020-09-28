import 'package:bloc/bloc.dart';
///
//
/// @About:     Main App file
// @File:       main.dart
// @Date:       09-28-20
// @Version:    popular_citiies 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:flutter/material.dart';
import 'package:popular_citiies/blocs/simple_bloc_delegate.dart';
import 'package:popular_citiies/repositories/preferences_repository.dart';
import 'package:popular_citiies/widgets/app.dart';

import 'blocs/preferences_bloc/preferences_bloc.dart';

void main()
{

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
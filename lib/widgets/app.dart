///
//
/// @About:     
// @File:       app.dart 
// @Date:       09-28-20
// @Version:    popular_citiies 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_citiies/blocs/omboarding_bloc/omboarding_bloc.dart';
import 'package:popular_citiies/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:popular_citiies/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:popular_citiies/repositories/preferences_repository.dart';
import 'package:popular_citiies/widgets/utils/colors.dart';
import 'package:popular_citiies/widgets/utils/navigation.dart';
import 'package:popular_citiies/widgets/views/home_page.dart';
import 'package:popular_citiies/widgets/views/omboarding_page.dart';

class App extends StatelessWidget
{
  final Preferences prefs;
  final PreferencesBloc preferencesBloc;

  const App({
    Key key,
    @required this.prefs,
    @required this.preferencesBloc
  }) : assert(prefs != null),
        assert(preferencesBloc != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Preferences>.value(
          value: prefs,
        )
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<PreferencesBloc>.value(value: preferencesBloc),
            BlocProvider<OmboardingBloc>(
              create: (context) => OmboardingBloc(),
            ),
            BlocProvider<HomePageBloc>(
              create: (context) => HomePageBloc(),
            ),
            /*BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
            BlocProvider<RegisterBloc>(
              create: (context) => RegisterBloc(),
            ),
            BlocProvider<FavoritesBloc>(
              create: (context) => FavoritesBloc(),
            ),
            BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(),
            ),*/

          ],
          child: BlocBuilder<PreferencesBloc, PreferencesState>(
              builder: (bContext, bState)
              {
                Widget home = OmboardingPage();

                if(bState is PreferencesLoaded)
                {
                  if(bState.first)
                  {
                    home = OmboardingPage();
                  }
                  else {
                    home = HomePage();
                  }
                }
                return MaterialApp(
                  title: 'Champagne Power',
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  theme: ThemeData(
                    primaryColor: AppColors.primary,
                    fontFamily: 'Avenir',
                  ),
                  home: home,
                  navigatorObservers: <NavigatorObserver>[
                    CupertinoSwipeBackObserver(),
                  ],
                );
              }
          )
      ),
    );
  }
}
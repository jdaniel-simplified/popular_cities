///
//
/// @About:     
// @File:       home_page.dart 
// @Date:       09-28-20
// @Version:    popular_cities 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_cities/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/widgets/utils/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<City> cities = [];
  bool loading = true;

  @override
  void initState() {

    context.bloc<HomePageBloc>().add(DoGetHomePageState());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomePageBloc, HomePageState>(
        listener: (context, state)
        {
            if(state is GateHomePageState)
            {
              cities = state.cities;
              for(int i = 0; i < cities.length; i++)
              {
                print(cities[i].name);
              }
              loading = false;
            }
        },
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (ctx, st)
          {
            return Stack(
              children: [
                Loading().loadingProgress(context, loading)
              ],
            );
          },
        ),
      )
    );
  }
}

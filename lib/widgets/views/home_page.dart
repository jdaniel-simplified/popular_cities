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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popular_cities/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/repositories/search_deledate.dart';
import 'package:popular_cities/widgets/utils/cards.dart';
import 'package:popular_cities/widgets/utils/loading.dart';
import 'package:popular_cities/widgets/utils/screen_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<City> cities = [];
  bool loading = true;
  bool desc = true;
  IconData sort = FontAwesomeIcons.sortNumericDown;
  @override
  void initState() {

    context.bloc<HomePageBloc>().add(DoGetHomePageState(desc));
    super.initState();
  }

  void didChangeAppLifecycleState(final AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.bloc<HomePageBloc>().add(DoGetHomePageState(desc));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenHelper screen = new ScreenHelper(context);
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
              desc = state.desc;
              print(desc);
              sort = desc ? FontAwesomeIcons.sortNumericDown : FontAwesomeIcons.sortNumericUp;
              loading = false;
            }

            if(state is GettingHomePageState)
            {
              loading = true;
            }
        },
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (ctx, st)
          {
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                        height: screen.setHeight(22),
                        width: screen.setWidth(100),
                        alignment: Alignment.bottomCenter,
                        child: Text('Descubre Centroamérica con nosotros', style: TextStyle(fontSize: screen.textSize(4), fontWeight: FontWeight.bold), textAlign: TextAlign.center)
                    ),
                    SizedBox(height: screen.setHeight(3)),
                    Material(
                      borderRadius: BorderRadius.circular(screen.setHeight(3)),
                      elevation: 4.0,
                      color: Colors.grey[300],
                      child: InkWell(
                        child: Container(
                          height: screen.setHeight(6),
                          width: screen.setWidth(86),
                          alignment: Alignment.center,
                          padding: screen.allBorders(1, 1, 8, 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Busca una ciudad', style: TextStyle(color: Colors.grey[800])),
                              Icon(Icons.search, color: Colors.grey[800])
                            ],
                          ),
                        ),
                        onTap: ()
                        {
                          showSearch(context: context, delegate: HomeSearch(cities));
                        },
                      )
                    ),
                    SizedBox(height: screen.setHeight(1)),
                    Container(
                      margin: screen.sameBorders(0, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Capitales de Centroamérica', style: TextStyle(fontSize: screen.textSize(2.6), fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                          IconButton(
                            icon: Icon(sort),
                            onPressed: () => context.bloc<HomePageBloc>().add(DoGetHomePageState(!desc)),
                          )
                        ],
                      )
                    ),
                    SizedBox(height: screen.setHeight(3)),
                    Container(
                      padding: screen.sameBorders(0, 3),
                      height: screen.setHeight(50),
                      width: screen.setWidth(94),
                      child: ListView(
                        padding: EdgeInsets.all(0),
                        children: cities.map((c) => PopularCitiesCards().cityCard(c, screen, context)).toList(),
                      ),
                    ),
                  ],
                ),
                Loading().loadingProgress(context, loading)
              ],
            );
          },
        ),
      )
    );
  }
}

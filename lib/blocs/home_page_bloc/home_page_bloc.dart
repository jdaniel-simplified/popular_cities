import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/repositories/cities_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if(event is DoGetHomePageState)
    {
      yield GettingHomePageState();

      try
      {
        List<City> cities;

        cities = await CitiesRepository().getCities();

        yield GateHomePageState(cities);
      }
      catch(e, st)
      {
        print(e.toString() + ':::' + st.toString());
        yield ErrorHomePageState(e.toString());
      }
    }
  }
}

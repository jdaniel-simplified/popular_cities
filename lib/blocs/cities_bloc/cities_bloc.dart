import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:popular_cities/models/cities_model.dart';
import 'package:popular_cities/repositories/cities_repository.dart';
import 'package:popular_cities/repositories/preferences_repository.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesInitial());

  @override
  Stream<CitiesState> mapEventToState(
    CitiesEvent event,
  ) async* {
    if(event is DoAddLikeToCityEvent)
    {
      yield AddingLikeToCityState();

      try
      {
        event.city.likes+=1;

        await CitiesRepository().addLike(event.city);
        //await PreferencesImpl().saveFavorites(event.city);
        yield AddedLikeToCityState(event.city);
      }
      catch(e, st)
      {
        print(e.toString() + ':::' + st.toString());
        yield ErrorCitiesState(e.toString());
      }
    }
  }
}

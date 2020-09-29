import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesInitial());

  @override
  Stream<CitiesState> mapEventToState(
    CitiesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

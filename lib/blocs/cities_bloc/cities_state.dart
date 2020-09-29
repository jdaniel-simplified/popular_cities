part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();
}

class CitiesInitial extends CitiesState {
  @override
  List<Object> get props => [];
}

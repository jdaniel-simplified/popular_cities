part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();
}

class CitiesInitial extends CitiesState {
  @override
  List<Object> get props => [];
}

class AddingLikeToCityState extends CitiesState
{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AddedLikeToCityState extends CitiesState
{
  final City city;

  AddedLikeToCityState(this.city);

  @override
  // TODO: implement props
  List<Object> get props => [city];
}

class ErrorCitiesState extends CitiesState
{
  final String error;

  ErrorCitiesState(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
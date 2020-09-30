part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();
}

class DoAddLikeToCityEvent extends CitiesEvent
{
  final City city;

  DoAddLikeToCityEvent(this.city);

  @override
  // TODO: implement props
  List<Object> get props => [city];
}
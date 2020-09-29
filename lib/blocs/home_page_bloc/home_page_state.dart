part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  @override
  List<Object> get props => [];
}

class GettingHomePageState extends HomePageState
{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class GateHomePageState extends HomePageState
{
  final List<City> cities;

  GateHomePageState(this.cities);
  @override
  // TODO: implement props
  List<Object> get props => [cities];

}

class ErrorHomePageState extends HomePageState
{
  final String error;

  ErrorHomePageState(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];

}

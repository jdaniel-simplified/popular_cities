part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class DoGetHomePageState extends HomePageEvent
{
  final bool desc;

  DoGetHomePageState(this.desc);
  @override
  // TODO: implement props
  List<Object> get props => [desc];

}
part of 'preferences_bloc.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();
}

class PreferencesInitial extends PreferencesState {
  @override
  List<Object> get props => [];
}

class PreferencesNotLoaded extends PreferencesState 
{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PreferencesLoaded extends PreferencesState 
{
  final bool islogin;
  final bool first;
  final User user;
  PreferencesLoaded(this.islogin, this.first, this.user);
  
  @override
  // TODO: implement props
  List<Object> get props => [islogin, first, user];
}

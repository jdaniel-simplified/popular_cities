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

  final bool first;
  PreferencesLoaded(this.first);
  
  @override
  // TODO: implement props
  List<Object> get props => [first];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'omboarding_event.dart';
part 'omboarding_state.dart';

class OmboardingBloc extends Bloc<OmboardingEvent, OmboardingState> {
  OmboardingBloc() : super(OmboardingInitial());

  @override
  Stream<OmboardingState> mapEventToState(
    OmboardingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

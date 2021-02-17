import 'dart:async';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';

import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _repository;
  AuthenticationBloc(UserRepository repository)
      : assert(repository != null), _repository = repository,
        super(AuthenticationStateInitial());

  @override
  AuthenticationState get initialState => AuthenticationStateInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {

    if (event is AppStarted) {
      yield* _mapAppStartedToState(event);
    }

    if(event is UserSignedUp){
      yield* _mapUserSignedUpToState(event);
    }
    
    if(event is UserLoggedIn){
      yield* _mapUserLoggedInToState(event);
    }

    if(event is UserLoggedOut){
      yield* _mapUserLoggedOutToState(event);
    }

  }

  Stream<AuthenticationState> _mapAppStartedToState(AppStarted event) async* {
    yield AuthenticationStateLoading();
    try{
      final currentUser = await _repository.getCurrentUser();
      if(currentUser != null){
        yield AuthenticationStateAuthenticated(user: currentUser, );
      } else {
        yield AuthenticationStateUnAuthenticated();
      }
    }catch(err){
      yield AuthenticationStateFailure(errorMessage: err.message ?? 'An Unknown Has Error Occurred');
    }
  }

  Stream<AuthenticationState> _mapUserSignedUpToState(UserSignedUp event) async* {
    yield AuthenticationStateAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(UserLoggedIn event) async* {
    yield AuthenticationStateAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(UserLoggedOut event) async* {
    await _repository.logOut();
    yield AuthenticationStateUnAuthenticated();
  }

}
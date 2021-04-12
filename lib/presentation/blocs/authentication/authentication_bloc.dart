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
      await _repository.deleteTokens(event.accessToken, event.refreshToken);
      yield* _mapUserLoggedOutToState(event);
    }

  }

  Stream<AuthenticationState> _mapAppStartedToState(AppStarted event) async* {
    yield AuthenticationStateLoading();
    try{
      final hasTokens = await _repository.checkHasTokens(event.accessToken, event.refreshToken);
      print('hasTokens $hasTokens');
      final currentUser = await _repository.getCurrentUser();
      print('currentUser is\t $currentUser');
      // if(hasTokens && currentUser != null){
      if(hasTokens){
        yield AuthenticationStateAuthenticated(user: currentUser, );
      } else {
        yield AuthenticationStateUnAuthenticated();
      }
    }catch(err){
      print(err);
      // yield AuthenticationStateFailure(errorMessage: err.message ?? 'Error Completing Your Request, Try Again!');
      yield AuthenticationStateFailure(errorMessage: 'Error Completing Your Request, Try Again!');
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
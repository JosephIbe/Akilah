import 'dart:async';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:akilah/presentation/blocs/authentication/auth.dart';
import 'package:bloc/bloc.dart';

import 'register.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final AuthenticationBloc _authenticationBloc;
  final UserRepository _userRepository;

  RegisterBloc(AuthenticationBloc authenticationBloc, UserRepository repository)
      : assert(authenticationBloc != null),
        assert(repository != null),
        _authenticationBloc = authenticationBloc,
        _userRepository = repository, super(RegisterStateInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if(event is RegisterWithEmail) {
      yield* _mapRegisterWithEmailToState(event);
    }
  }

  // Stream<RegisterState> _mapRegisterWithEmailToState(RegisterWithEmail event) async* {
  //   yield RegisterStateLoading();
  //   try {
  //     final user = await _userRepository.registerUser(event.body);
  //     if(user != null){
  //       _authenticationBloc.add(UserSignedUp(user: user));
  //       yield RegisterStateSuccess();
  //     } else {
  //       yield RegisterStateFailure(errorMessage: 'Registration UnSuccessful');
  //     }
  //   } catch (err){
  //     print(err);
  //     yield RegisterStateFailure(errorMessage: 'Error Completing Your Request, Try Again!');
  //   }
  // }

  Stream<RegisterState> _mapRegisterWithEmailToState(RegisterWithEmail event) async* {
    yield RegisterStateLoading();
    try {
      final user = await _userRepository.registerUser(event.body);
      if(user != null){
        _authenticationBloc.add(UserSignedUp(user: user));
        yield RegisterStateSuccess();
        // yield LoginStateInitial();
      } else {
        yield RegisterStateFailure(errorMessage: 'Something very weird just happened');
      }
      // } on SocketException catch (e) {
      //   yield LoginStateFailure(errorMessage: e.message);
    } catch (err){
      print(err);
      yield RegisterStateFailure(errorMessage: 'Error Completing Your Request, Try Again!');
    }
  }

}
import 'dart:async';
import 'package:akilah/domain/repositories/user_repository.dart';
import 'package:akilah/presentation/blocs/user/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final UserRepository _userRepository;
  UserBloc(UserRepository repository)
      : assert (repository != null),
      _userRepository = repository,
      super(UserStateInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is GetUserProfileDetails){
      yield* _mapGetUserProfileDetailsToState(event);
    }
  }

  Stream<UserState> _mapGetUserProfileDetailsToState(GetUserProfileDetails event) async* {
    // yield UserStateLoading();
    try {
      final user = await _userRepository.getCurrentUser();
      if(user != null){
        yield UserStateSuccess();
      }else {
        yield UserStateFailure(errorMessage: 'Unable to Fetch Profile Details');
      }
    } catch (err){
      print(err);
      yield UserStateFailure(errorMessage: 'Error Completing Your Request, Try Again!');
    }
  }
}

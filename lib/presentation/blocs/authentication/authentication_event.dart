import 'package:akilah/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{

  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {

  final String accessToken;
  final String refreshToken;

  const AppStarted({@required this.accessToken, @required this.refreshToken});

  @override
  List<Object> get props => [accessToken, refreshToken];

}

class UserSignedUp extends AuthenticationEvent {
  final UserModel user;
  final String accessToken;
  final String refreshToken;

  const UserSignedUp({
    @required this.user,
    @required this.accessToken,
    @required this.refreshToken
  });

  @override
  List<Object> get props => [user, ];

}

class UserLoggedIn extends AuthenticationEvent {
  final UserModel user;
  // final UserResponseModel user;
  final String accessToken;
  final String refreshToken;

  const UserLoggedIn({
    @required this.user,
    @required this.accessToken,
    @required this.refreshToken
  });

  @override
  List<Object> get props => [user];
}

class UserRequestsOTP extends AuthenticationEvent {
  final int phone;
  UserRequestsOTP({@required this.phone});

  @override
  List<Object> get props => [phone];

}

class UserLoggedOut extends AuthenticationEvent {

  final String accessToken;
  final String refreshToken;

  const UserLoggedOut({
    @required this.accessToken,
    @required this.refreshToken,
  });

  @override
  List<Object> get props => [accessToken, refreshToken];
}
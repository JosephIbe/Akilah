// part of 'authentication_bloc.dart';

import 'package:akilah/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthenticationStateInitial extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateUnAuthenticated extends AuthenticationState {}

class AuthenticationStateGetOTP extends AuthenticationState {

  final int phone;
  AuthenticationStateGetOTP({@required this.phone});

  @override
  List<Object> get props => [phone];

}

class AuthenticationStateAuthenticated extends AuthenticationState {

  final UserModel user;
  // final String accessToken;
  // final String refreshToken;

  AuthenticationStateAuthenticated({@required this.user, });

  @override
  List<Object> get props => [user, ];

}

class AuthenticationStateFailure extends AuthenticationState {
  final String errorMessage;
  AuthenticationStateFailure({@required this.errorMessage});
}
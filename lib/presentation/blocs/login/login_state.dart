import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateFailure extends LoginState {

  final String errorMessage;
  LoginStateFailure({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}
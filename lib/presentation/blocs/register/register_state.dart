import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterStateInitial extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateSuccess extends RegisterState {}

class RegisterStateFailure extends RegisterState {

  final String errorMessage;
  RegisterStateFailure({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}
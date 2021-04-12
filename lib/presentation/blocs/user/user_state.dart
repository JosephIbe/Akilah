import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateSuccess extends UserState {}

class UserStateFailure extends UserState {
  final String errorMessage;
  UserStateFailure({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}
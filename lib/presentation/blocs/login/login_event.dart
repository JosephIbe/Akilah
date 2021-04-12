import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginWithEmail extends LoginEvent {

  final Map<String, dynamic> body;

  LoginWithEmail({@required this.body, });

  @override
  List<Object> get props => [body];

}
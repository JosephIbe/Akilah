import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class RegisterWithEmail extends RegisterEvent {

  final Map<String, dynamic> body;
  RegisterWithEmail({@required this.body});

  @override
  List<Object> get props => [body];

}
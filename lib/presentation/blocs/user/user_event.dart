import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class GetUserProfileDetails extends UserEvent {}
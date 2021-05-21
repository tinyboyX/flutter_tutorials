import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationEventStart extends AuthenticationEvent {}

class AuthenticationEventLoggedIn extends AuthenticationEvent {}

class AuthenticationEventLoggedOut extends AuthenticationEvent {}

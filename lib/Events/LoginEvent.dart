import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEventEmailChanges extends LoginEvent {
  final String email;

  LoginEventEmailChanges({this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'Email change to $email';
  }
}

class LoginEventPasswordChanges extends LoginEvent {
  final String password;

  LoginEventPasswordChanges({this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() {
    return 'Password change to $password';
  }
}

class LoginEventWithGooglePressed extends LoginEvent {}

class LoginEventWithEmailAndPasswordPressed extends LoginEvent {
  final String email;
  final String password;

  LoginEventWithEmailAndPasswordPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginEventWithEmailAndPasswordPressed, email = $email, password = $password';
}

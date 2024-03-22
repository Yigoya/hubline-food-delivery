import 'package:flutter/material.dart';

class AuthEvent {}

class SignUpEvent extends AuthEvent {
  BuildContext context;
  String fullname;
  String email;
  String phone;
  String password;
  String confirm;
  SignUpEvent(this.fullname, this.email, this.phone, this.password,
      this.confirm, this.context);
}

class LoginEvent extends AuthEvent {
  BuildContext context;
  String email;
  String password;
  LoginEvent(this.email, this.password, this.context);
}

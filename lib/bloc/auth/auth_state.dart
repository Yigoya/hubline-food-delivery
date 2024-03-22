import 'package:hubline/model/Customer.dart';

class AuthState {
  String token;
  Customer customer;
  AuthState(this.token, this.customer);
}

class InitialState extends AuthState {
  String? error;
  InitialState({this.error})
      : super(
            "",
            Customer(
                id: 1,
                fullname: 'fullname',
                password: 'password',
                email: 'email',
                phonenumber: 1234567890));
}

class LoadingState extends AuthState {
  LoadingState()
      : super(
            "token",
            Customer(
                id: 1,
                fullname: 'fullname',
                password: 'password',
                email: 'email',
                phonenumber: 1234567890));
}

class SignUpState extends AuthState {
  SignUpState(String token, Customer customer) : super(token, customer);
}

class LoginState extends AuthState {
  LoginState(String token, Customer customer) : super(token, customer);
}

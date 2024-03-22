import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hubline/model/Customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final dio = Dio();
  static String SERVER = 'http://192.168.31.17:3000';

  Future<Customer?> get customer async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('customer') ?? '';
    if (value == '') return null;
    return Customer.fromMap(jsonDecode(value));
  }

  Future<void> setCustomer(Customer customer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('customer', jsonEncode(customer.toMap()));
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> get token async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>> login(String? email, String password) async {
    var data = {
      'email': email,
      'password': password,
    };
    final res = await dio.post(SERVER + "/user/login", data: data);

    print(res);

    return {
      'user': Customer.fromMap(res.data['user']),
      'token': res.data['token']
    };
  }

  Future<Map<String, dynamic>> signup(
      String fullname, String email, String password) async {
    var data = {
      'fullname': fullname,
      'email': email,
      'password': password,
    };
    final res = await dio.post(SERVER + "/user/signup", data: data);

    print(res);

    return {
      'user': Customer.fromMap(res.data['user']),
      'token': res.data['token']
    };
  }
}

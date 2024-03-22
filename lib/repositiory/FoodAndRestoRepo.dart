import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hubline/model/Food.dart';
import 'package:hubline/model/Restaurant.dart';
import 'package:hubline/repositiory/AuthRepo.dart';

class FoodAndRetaurRepo {
  final dio = Dio();
  final SERVER = AuthRepo.SERVER;
  final authRepo = AuthRepo();
  Future<List<Food>> foods() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
    };

    final options = Options(headers: headers);

    final res = await dio.get(SERVER + "/food/foods", options: options);
    final data = res.data['data'] as List<dynamic>;

    final food = data.map((e) => Food.fromMap(e)).toList();
    print(food);
    return food;
  }

  Future<Food> getCatagory(int id) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
    };

    final options = Options(headers: headers);

    final res = await dio.get("$SERVER/food/getcatagory", options: options);

    print(res);

    final data = res.data['data'] as List<Map<String, dynamic>>;
    final food = data.map((e) => Food.fromMap(e)).toList();
    return food[0];
  }

  Future<Food> food(int id) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
    };

    final options = Options(headers: headers);

    final res = await dio.get("$SERVER/food/foods/$id", options: options);

    print(res);

    final data = res.data['data'] as List<Map<String, dynamic>>;
    final food = data.map((e) => Food.fromMap(e)).toList();
    return food[0];
  }

  Future<List<Restaurant>> restaurants() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
    };

    final options = Options(headers: headers);

    final res =
        await dio.get("$SERVER/restaurant/restaurants", options: options);
    print(res.data['data']);
    final data = res.data['data'] as List<dynamic>;
    final food = data.map((e) => Restaurant.fromMap(e)).toList();
    print(food);
    return food;
  }

  Future<Restaurant> restaurant(int id) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
    };

    final options = Options(headers: headers);

    final res =
        await dio.get("$SERVER/restaurant/restaurants/$id", options: options);

    print(res);

    final data = res.data['data'] as List<Map<String, dynamic>>;
    final restaurant = data.map((e) => Restaurant.fromMap(e)).toList();
    return restaurant[0];
  }

  Future<void> order(int customerid, int restaurantid, int customeraddressid,
      int totalamount, Map<String, int> foods) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
    };
    // var food = jsonEncode(foods);
    print(food);
    Map<String, dynamic> data = {
      "customerid": customerid,
      "restaurantid": restaurantid,
      "customeraddressid": customeraddressid,
      "isPrepared": 1,
      "isdelivered": 1,
      "totalamount": totalamount,
    };

    final options = Options(headers: headers);

    final res =
        await dio.post("$SERVER/food/foodorder", data: data, options: options);
    print(res.data['id']);
    final headers2 = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpZ295YTVAZ21haWwuY29tIiwiaWF0IjoxNzA5NzU3NzUwfQ.LdcJi4pufQEfYbTGCy34uU6ZDd5-xhCyaxKAw7k_PnA', // Replace with your token
      'Content-Type': 'application/json',
      'orderid': res.data['data']
    };
    print(headers2);
    final options2 = Options(headers: headers2);
    final rres =
        await dio.post("$SERVER/food/order", data: foods, options: options2);
    print(res.data);
  }
}

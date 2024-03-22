import 'package:flutter/material.dart';
import 'package:hubline/model/Restaurant.dart';
import 'package:hubline/pages/auth/LoginPage.dart';
import 'package:hubline/pages/auth/SignupPage.dart';
import 'package:hubline/pages/error/ErrorPage.dart';
import 'package:hubline/pages/food/FoodPage.dart';
import 'package:hubline/pages/home/HomePage.dart';
import 'package:hubline/pages/order/OrderPage.dart';
import 'package:hubline/pages/restaurant/RestaurantPage.dart';
import 'package:hubline/utility.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(settings: settings, builder: (_) => HomePage());
    case '/login':
      return MaterialPageRoute(settings: settings, builder: (_) => LoginPage());
    case '/signup':
      return MaterialPageRoute(
          settings: settings, builder: (_) => SignupPage());
    case '/food':
      return MaterialPageRoute(settings: settings, builder: (_) => FoodPage());
    case '/restaurant':
      final restaurant = settings.arguments as Restaurant;
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => RestaurantPage(
                restaurant: restaurant,
              ));
    case '/order':
      return MaterialPageRoute(settings: settings, builder: (_) => OrderPage());
    case '/error':
      final data = settings.arguments;
      return MaterialPageRoute(
          settings: settings, builder: (_) => ErrorPage(data: data));
    default:
      final arg = {
        "type": ErrorType.noconnect,
        "msg": "the page doesn't exist"
      };
      return MaterialPageRoute(
          settings: settings, builder: (_) => ErrorPage(data: arg));
  }
}

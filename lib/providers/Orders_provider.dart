import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../Api/api.dart';
import '../models/Orders_model.dart';

class OrdersProviders with ChangeNotifier{

  List<Order> _OrdersList = [];
  
  Future<List<Order>> get_Orders(
      {int page = 1, List<Order> previous_order = const []})async {
    String url = "supervisor/orders/";
    url += "?page=$page";
    try {
      final response = await Api.Get(url: url);
      var decodedJson = json.decode(response!.body);
      int order_count = decodedJson["count"];
      List<Order> orders = [];
      for (var item in decodedJson["results"]) {
        orders.add(Order.fromMap(item));
      }
      List<Order> results = orders;
      _OrdersList = results;
  
      return _OrdersList;
    }catch (e) {
      print("error loading orders");
      print(e.toString());
      return [];
    }


  }
  List<Order> get orderList {
    return _OrdersList;
  }








}
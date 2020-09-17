

import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;


  OrderItem({
   @required this.id,
   @required  this.amount,
   @required  this.products,
   @required  this.dateTime
  });
  }

  class Order with ChangeNotifier {
    List<OrderItem> _orders = [];

    List<OrderItem> get orders {
      return [..._orders];
    }

    Future<void> fetchOrders() async {
      const url = 'https://flutter-shop-d5400.firebaseio.com/orders.json';
      try {
        final response = await http.get(url);
        print(json.decode(response.body));
      } catch (error) {
        throw error;
      }
    }

      Future<void> addOrder(List<CartItem> cartProducts, double total) async{
        const url = 'https://flutter-shop-d5400.firebaseio.com/orders.json';
        final response = await http.post(url);
        print(json.decode(response.body));
        _orders.insert(0, OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartProducts,
        )
        );
        notifyListeners();
      }
    }

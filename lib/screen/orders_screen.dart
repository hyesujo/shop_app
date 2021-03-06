import 'package:flutter/material.dart';
import 'package:my_shop/providers/orders.dart' show Order;
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/widgets/order_item.dart';


class OrdersScreen extends StatelessWidget {
  static const routeName = '/ordersScreen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body : ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            OrderItem(orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}

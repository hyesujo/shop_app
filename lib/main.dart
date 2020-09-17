

import 'package:flutter/material.dart';

import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:my_shop/screen/edit_product_screen.dart';
import 'package:my_shop/screen/orders_screen.dart';
import 'package:my_shop/screen/product_detail_screen.dart';
import 'package:my_shop/screen/cart_screen.dart';
import 'package:my_shop/providers/productsprovider.dart';
import 'package:my_shop/screen/products_overview_screen.dart';
import 'package:my_shop/screen/user_product_screen.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider.value(value: Order()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My shop',
          theme: ThemeData(
              primarySwatch: Colors.cyan,
              accentColor: Colors.deepOrange,
              fontFamily: 'Signika'),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductScreen.routeName: (context) => UserProductScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          }),
    );
  }
}

class ChangeNotirierProvider {
  static value({value}) {}
}

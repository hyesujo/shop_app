import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite = false;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      bool isFavorite
      });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }


  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try{
      final url = 'https://flutter-shop-d5400.firebaseio.com/productsprovider/$id.json';
     final response =  await http.patch(url,
          body: json.encode({
            "isFavorite" : isFavorite,
          }),
     );
     if (response.statusCode >= 400) {
      _setFavValue(oldStatus);
     }
    } catch (error) {
      _setFavValue(oldStatus);
  }
}
}
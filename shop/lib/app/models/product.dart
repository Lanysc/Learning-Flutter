import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/app/utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    try {
      _toggleFavoriteStatus();

      final response = await http.patch(
          Uri.parse('${Constants.productBaseUrl}/$id.json'),
          body: jsonEncode({"isFavorite": isFavorite}));

      if (response.statusCode >= 400) {
        isFavorite = !isFavorite;
        notifyListeners();
      }
    } catch (error) {
      _toggleFavoriteStatus();
    }
  }
}

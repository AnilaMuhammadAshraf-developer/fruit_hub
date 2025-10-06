import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruit_hub/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  bool isLoading = false;
  List<Product> products = [];

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://fakestoreapi.com/products");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        products = data.map((item) => Product.fromJson(item)).toList();
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  void filterSearch(String query){
    
  }
}
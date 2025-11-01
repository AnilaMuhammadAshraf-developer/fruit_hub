import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruit_hub/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];
  List<Map<String, dynamic>> _categories = [];
  List<Map<String, dynamic>> _backendCategories = [];

  List<Product> get products =>_products;
  List<Map<String, dynamic>> get categories =>_categories;
  List<Map<String, dynamic>> get backendCategories =>_backendCategories;


    


  Future<void> fetchProducts() async {


    final url = Uri.parse("https://fakestoreapi.com/products");

   try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        _products
          ..clear()
          ..addAll(data.map((item) => Product.fromJson(item)).toList());
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }


  
  }

  void filterSearch(String query) {}
}

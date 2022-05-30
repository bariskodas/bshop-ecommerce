import 'package:bariskodas_testc/api/models/product_model.dart';
import 'package:bariskodas_testc/api/services/services.dart';
import 'package:flutter/material.dart';

//* I need min api requests

class GetProductsRiverpod extends ChangeNotifier {
  final _api = ApiServices();
  List<ProductModel> products = [];
  bool _isLoading = true;
  bool get isLoad => _isLoading;
  // bool get isHaveAnError => _api.getProducts();

// get product details
  void getProductsList() async {
    products = await _api.getProducts().whenComplete(() => _isLoading = false);
    notifyListeners();
  }

// categories
  List<String>? getCategories() {
    Set<String> categories = {};
    if (products.isNotEmpty) {
      for (var element in products) {
        categories.add(element.category.toString());
      }
      List<String> categoriesList = categories.toList();
      return categoriesList;
    }
    notifyListeners();
    return null;
  }

// sort products by categories
  List<ProductModel>? getSortedProducts({required String category}) {
    List<ProductModel> sortedList = [];
    if (products.isNotEmpty) {
      for (var element in products) {
        if (element.category == category) {
          sortedList.add(element);
        }
      }
    }
    return sortedList;
  }
}

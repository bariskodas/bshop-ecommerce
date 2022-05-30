import 'package:bariskodas_testc/api/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartRiverpod extends ChangeNotifier {
  // add method
  Future<void> addToProductList(ProductModel model) async {
    Map<String, dynamic> data = model.toJson();
    List products = readProductList();
    var box = Hive.box("cartList");
    box.put(model.id, data);
    calculateTotalPrice();
    notifyListeners();
  }

  // read method
  List readProductList() {
    var box = Hive.box("cartList");
    List productList = box.values.toList();
    return productList;
  }

  // delete single - dismissed
  Future<void> deleteSingleProduct({required dynamic id}) async {
    var box = Hive.box("cartList");
    await box.delete(id);
    notifyListeners();
  }

  // delete all products
  deleteAllProducts() async {
    var box = Hive.box("cartList");
    await box.clear();
    calculateTotalPrice();
    notifyListeners();
  }

  // calculate total price
  double calculateTotalPrice() {
    double totalPrice = 0;

    List products = readProductList();
    products.isEmpty
        ? totalPrice = 0
        : products.forEach((element) {
            double productPrice =
                double.parse(element["price"]) * element["count"];
            totalPrice = totalPrice + productPrice;
          });
    return totalPrice;
  }

  Future<void> incrementProductCount(dynamic id) async {
    var box = Hive.box("cartList");
    var data = box.get(id);
    data["count"] = data["count"] + 1;
    await box.put(id, data);
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> decrementProductCount({required dynamic id}) async {
    var box = Hive.box("cartList");
    var data = box.get(id);
    if (data["count"] < 1) {
      deleteSingleProduct(id: id);
    } else if (data["count"] >= 1) {
      data["count"] = data["count"] - 1;
      await box.put(id, data);
    }
    calculateTotalPrice();
    notifyListeners();
  }
}

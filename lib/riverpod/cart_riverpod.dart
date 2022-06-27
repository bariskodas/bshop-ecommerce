import 'package:bariskodas_testc/api/models/product_model.dart';
import 'package:bariskodas_testc/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartRiverpod extends ChangeNotifier {
  final _box = Hive.box("cartList");
  // add method
  Future<void> addToProductList(ProductModel model, String colorName) async {
    Map<String, dynamic> data = model.toJson();
    data.addAll({"colorName":colorName});

    _box.put(model.id, data).whenComplete(() =>
        Constants.scaffoldKey.currentState!.showSnackBar(const SnackBar(
            content: Text("Your choise is added to cart."),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            dismissDirection: DismissDirection.down)));
    calculateTotalPrice();
    notifyListeners();
  }

  // read method
  List readProductList() {
    List productList = _box.values.toList();
    return productList;
  }

  // delete single - dismissed
  Future<void> deleteSingleProduct({required dynamic id}) async {
    await _box.delete(id);
    notifyListeners();
  }

  // delete all products
  deleteAllProducts() async {
    await _box.clear();
    calculateTotalPrice();
    notifyListeners();
  }

  // calculate total price
  double calculateTotalPrice() {
    double totalPrice = 0;

    List products = readProductList();
    products.isEmpty
        ? totalPrice = 0
        // ignore: avoid_function_literals_in_foreach_calls
        : products.forEach((element) {
            double productPrice =
                double.parse(element["price"]) * element["count"];
            totalPrice = totalPrice + productPrice;
          });
    return totalPrice;
  }

  Future<void> incrementProductCount(dynamic id) async {
    var data = _box.get(id);
    data["count"] = data["count"] + 1;
    await _box.put(id, data);
    calculateTotalPrice();
    notifyListeners();
  }

  Future<void> decrementProductCount({required dynamic id}) async {
    var data = _box.get(id);
    if (data["count"] < 1) {
      deleteSingleProduct(id: id);
    } else if (data["count"] >= 1) {
      data["count"] = data["count"] - 1;
      await _box.put(id, data);
    }
    calculateTotalPrice();
    notifyListeners();
  }
}

import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  // data store karana variable eka
  Product? _product;

  // deta genath denne meyagen/ data athulath karana eka
  addProduct(Product product) {
    _product = product;
    notifyListeners();
  }
  // deta eliyata ganne meyagen
  Product get selectedProduct=> _product!;
}

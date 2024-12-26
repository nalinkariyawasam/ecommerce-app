import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List> getCatageries() async {
    var url = Uri.https('fakestoreapi.com', 'products/categories');

    var respones = await http.get(url);
    //print(respones.body);
    List catogoryList = jsonDecode(respones.body);
    return catogoryList;
  }

  static Future<List> getProducts() async {
    var url = Uri.https('fakestoreapi.com', 'products');

    var respones = await http.get(url);
    //print(respones.body);
    List products = jsonDecode(respones.body);
    return products;
  }

  static getProductById({required String productId}) async {
    Uri url = Uri.https('fakestoreapi.com', 'products/$productId');

    http.Response respones = await http.get(url);

    print(respones.statusCode);
    print(respones.body);
  }

  static Future<List> getProductsByCategory({required String category}) async {
    Uri url = Uri.https('fakestoreapi.com', 'products/category/$category');

    http.Response respones = await http.get(url);
    List products = jsonDecode(respones.body);
    print(respones.body);
    return products;
    // print(respones.statusCode);
    // print(respones.body);
  }
}

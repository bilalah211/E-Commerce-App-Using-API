import 'dart:convert';

import 'package:ecommerceappusingapi/constants/api_urls.dart';
import 'package:ecommerceappusingapi/models/CartModel.dart';
import 'package:ecommerceappusingapi/models/products_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  Future<List<ProductsModel>> getProducts() async {
    Uri uri = Uri.parse(ApiUrl.getProductApi);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> productData = await jsonDecode(response.body);

      List<ProductsModel> products = productData
          .map((item) => ProductsModel.fromJson(item))
          .toList();

      if (kDebugMode) {
        print(products.length);
      }
      return products;
    }

    throw 'Status Code Is Different ${response.statusCode}';
  }

  //Cart Api
  Future<List<CartModel>> getCarts() async {
    Uri uri = Uri.parse(ApiUrl.getCartApi);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> productData = await jsonDecode(response.body);
      print('Cart Data${response.body}');
      return productData.map((json) => CartModel.fromJson(json)).toList();
      ;
    }

    throw 'Status Code Is Different ${response.statusCode}';
  }

  Future<ProductsModel?> postProducts(ProductsModel product) async {
    Uri uri = Uri.parse(ApiUrl.getProductApi);

    final response = await http.post(
      headers: {'Content-Type': 'application/json'},
      uri,
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return ProductsModel.fromJson(data);
    } else {
      throw 'Status Code Is Different ${response.statusCode}';
    }
  }
}

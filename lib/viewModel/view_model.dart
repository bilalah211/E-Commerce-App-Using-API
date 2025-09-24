import 'package:ecommerceappusingapi/api_services/repositories/products_repository.dart';
import 'package:ecommerceappusingapi/models/CartModel.dart';
import 'package:flutter/foundation.dart';

import '../models/products_model.dart';

class ProductsViewModel {
  final ProductsRepository _productRep = ProductsRepository();
  Future<List<ProductsModel>> getProducts() async {
    try {
      return await _productRep.getProducts();
    } catch (e, stacktrace) {
      debugPrint("Error in ProductsViewModel.getProducts: $e");
      debugPrint("Stacktrace: $stacktrace");
      rethrow; // let the error propagate
    }
  }

  Future<Future<List<CartModel>>> getCart() async {
    try {
      return _productRep.getCarts();
    } catch (e, stacktrace) {
      debugPrint("Error in ProductsViewModel.getProducts: $e");
      debugPrint("Stacktrace: $stacktrace");
      rethrow; // let the error propagate
    }
  }

  Future<ProductsModel?> postProducts(ProductsModel product) async {
    try {
      return _productRep.postProducts(product);
    } catch (e) {
      throw Exception('');
    }
  }
}

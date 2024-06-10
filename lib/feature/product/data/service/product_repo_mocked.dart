import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_store/feature/product/data/models/product_item.dart';
import 'package:fake_store/feature/product/domain/service/product_repo.dart';


class ProductRepoMocked implements ProductRepo{
  final dio = Dio();
  @override
  Future<List<String>> getCategoryList() async {
    try {
      final response =
          await dio.get('https://fakestoreapi.com/products/categories');
      if (response.statusCode ==200){
        final data = response.data;
        final resultList = <String>[];
        if (data is List) {
          for (var element in data) {
            if (element is String) resultList.add(element);
          }
        }
        return resultList;
      }
      
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<Product> getAllProductsLimit(int count) {
    // TODO: implement getAllProductsLimit
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductItem(int id) {
    // TODO: implement getProductItem
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductsCategory(String category) {
    // TODO: implement getProductsCategory
    throw UnimplementedError();
  }

}
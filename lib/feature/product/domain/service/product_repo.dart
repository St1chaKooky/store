
import 'package:dio/dio.dart';
import 'package:fake_store/feature/product/data/models/product_item.dart';

import 'package:retrofit/retrofit.dart';
part 'product_repo.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class ProductRepo {
  factory ProductRepo(Dio dio, {String baseUrl}) = _ProductRepo;
  @GET('/products/categories')
  Future<List<String>> getCategoryList();

  @GET('/products/{id}')
  Future<Product> getProductItem(@Path('id') int id);

  @GET('products?limit={count}')
  Future<Product> getAllProductsLimit(@Path('count') int count);

  @GET('products/category/{category}')
  Future<Product> getProductsCategory(@Path('category') String category);

}

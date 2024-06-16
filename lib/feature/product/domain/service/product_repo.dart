import 'package:dio/dio.dart';
import 'package:fake_store/feature/product/data/product_item.dart';

import 'package:retrofit/retrofit.dart';
part 'product_repo.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class ProductRepo {
  factory ProductRepo(Dio dio, {String baseUrl}) = _ProductRepo;
  @GET('/products/categories')
  Future<List<String>> getCategoryList();

  @GET('/products/{id}')
  Future<Product> getProductItem(@Path('id') int id);

  @GET('products')
  Future<List<Product>> getAllProductsLimit(
    @Query('limit') int count,
  );

  @GET('products/category/{category}')
  Future<List<Product>> getProductsCategory(
    @Path('category') String category, 
    );
}

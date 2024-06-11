import 'package:fake_store/feature/product/data/models/product_item.dart';

sealed class ProductsListState {}

class LoadingProductState extends ProductsListState {}

class UpdateProductState extends ProductsListState {
  bool isFull;
  List<Product> productsList;
  UpdateProductState({required this.productsList, required this.isFull});
}
class UpdateProductItemState extends ProductsListState {
  final Product product;
  UpdateProductItemState({required this.product});
}
class UpdateCategoryProductState extends ProductsListState {
  bool isFull;
  List<Product> productsList;
  UpdateCategoryProductState({required this.productsList, required this.isFull});
}

sealed class ProductsListEvent {}

class PaginationProducts extends ProductsListEvent {}

class GetCategoriesProducts extends ProductsListEvent {
  final String keyCategory;

  GetCategoriesProducts({required this.keyCategory});
}

class GetProductItem extends ProductsListEvent {
  final int id;

  GetProductItem({required this.id});
}

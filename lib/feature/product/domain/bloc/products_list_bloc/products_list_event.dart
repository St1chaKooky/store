sealed class ProductsListEvent {}

class PaginationProducts extends ProductsListEvent {
  final String keyCategory;
  PaginationProducts({required this.keyCategory});
}

class GetProductItem extends ProductsListEvent {
  final int id;

  GetProductItem({required this.id});
}

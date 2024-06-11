import 'package:fake_store/feature/product/data/models/product_item.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_event.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_state.dart';
import 'package:fake_store/feature/product/domain/service/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductRepo repo;
  ProductsListBloc({required this.repo})
      : super(LoadingProductState()) {
    on<PaginationProducts>((event, emit) async {
        countItemProduct +=5;
        List<Product> newProductList = await repo.getAllProductsLimit(countItemProduct);
        if (newProductList.length != productsList.length) {
          productsList.addAll(newProductList.sublist(countItemProduct-5));
        emit(UpdateProductState(productsList:productsList, isFull: false));
        } else {
         emit(UpdateProductState(productsList: productsList, isFull: true));
        }
    },);

      on<GetCategoriesProducts>((event, emit) async {
      countItemProduct +=5;
      List<Product> newProductList = await repo.getProductsCategory(event.keyCategory,countItemProduct);
      if (newProductList.length != productsList.length) {
          productsCategoryList.addAll(newProductList.sublist(countItemProduct-5));
        emit(UpdateCategoryProductState(productsList:productsCategoryList, isFull: false));
        } else {
         emit(UpdateCategoryProductState(productsList: productsCategoryList, isFull: true));
        }
    },);

      on<GetProductItem>((event, emit)async {
        emit(LoadingProductState());
        int id = event.id;
        Product product = await repo.getProductItem(id);
        emit(UpdateProductItemState(product:product ));
      },);
  }
  int countItemProductCategory = 0;
  int countItemProduct = 0;
  List<Product>  productsList = [];
  List<Product>  productsCategoryList = [];


}
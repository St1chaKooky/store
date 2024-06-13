import 'dart:developer';

import 'package:fake_store/feature/product/data/product_item.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_event.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_state.dart';
import 'package:fake_store/feature/product/domain/service/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductRepo repo;
  ProductsListBloc({required this.repo})
      : super(LoadingProductState()) {
    on<PaginationProducts>((event, emit) async {
        List<Product> newProductList = [];
        
        if (event.keyCategory == ''){
          productsList.isEmpty ? countItemProduct = 0 : null;
          countItemProduct +=4;
          try {
            newProductList = await repo.getAllProductsLimit(countItemProduct);
          if (newProductList.length != productsList.length) {
          productsList.addAll(newProductList.sublist(countItemProduct-4));
        emit(UpdateProductState(productsList:productsList, isFull: false));
        } else {
         emit(UpdateProductState(productsList: productsList, isFull: true));
        }
          } catch (e){
            log(e.toString());
          }
          
        } else {
          productsList = [];
          try{
            newProductList = await repo.getProductsCategory(event.keyCategory);
          emit(UpdateProductState(productsList: newProductList, isFull: true));
          } catch(e){
            log(e.toString());
          } 
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


}
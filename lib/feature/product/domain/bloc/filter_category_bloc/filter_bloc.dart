import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fake_store/feature/product/domain/bloc/filter_category_bloc/filter_event.dart';
import 'package:fake_store/feature/product/domain/bloc/filter_category_bloc/filter_state.dart';
import 'package:fake_store/feature/product/domain/service/product_repo.dart';


class FilterBloc extends Bloc<FilterEvent, FilterState> {
  ProductRepo repo;
  FilterBloc({required this.repo})
      : super(LoadingFilterState()) {

    on<GetCategories>((event, emit) async {
      emit(LoadingFilterState());
      categoryList = await repo.getCategoryList();
      currentCategoriesMap = {
        for (var element in categoryList) element: false
      };//создается мапа что все фолз
      emit(UpdateFilterState(currentCategoriesMap: currentCategoriesMap, currentCategoriesList: categoryList));
    },);

    on<EditCategory>((event, emit) {
      emit(LoadingFilterState());
       currentCategoriesMap = {
        for (var element in categoryList) element: false };
      currentCategoriesMap[categoryList[event.index]] = event.isSelected;
      if (event.isSelected == true){
      String nameCategory = categoryList[event.index];
      categoryList.removeWhere((element) => element == nameCategory);
      categoryList.insert(0,nameCategory);
      }
      log(categoryList.toString());
      emit(UpdateFilterState(currentCategoriesMap: currentCategoriesMap, currentCategoriesList: categoryList));
    },);
    

  }
  Map<String, bool> currentCategoriesMap = {};
   List<String>  categoryList = [];

}

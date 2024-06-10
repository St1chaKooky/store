import 'package:bloc/bloc.dart';
import 'package:fake_store/feature/product/data/service/product_repo_mocked.dart';
import 'package:fake_store/feature/product/domain/filter_category/filter_event.dart';
import 'package:fake_store/feature/product/domain/filter_category/filter_state.dart';


class FilterBloc extends Bloc<FilterEvent, FilterState> {
  ProductRepoMocked repo;
  FilterBloc({required this.repo})
      : super(LoadingState()) {

    on<GetCategories>((event, emit) async {
      emit(LoadingState());
      categoryList = await repo.getCategoryList();
      currentCategoriesMap = {
        for (var element in categoryList) element: false
      };//создается мапа что все фолз
      emit(UpdateState(currentCategoriesMap: currentCategoriesMap, currentCategoriesList: categoryList));
    },);

    on<EditCategory>((event, emit) {
      emit(LoadingState());
      currentCategoriesMap[categoryList[event.index]] = event.isSelected;
      if (event.isSelected == true){
      String nameCategory = categoryList[event.index];
      categoryList.removeWhere((element) => element == nameCategory);
      categoryList.insert(0,nameCategory);
      }

      emit(UpdateState(currentCategoriesMap: currentCategoriesMap, currentCategoriesList: categoryList));
    },);

  }
  Map<String, bool> currentCategoriesMap = {};
   List<String>  categoryList = [];

}

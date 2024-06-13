import 'dart:developer';

import 'package:fake_store/feature/product/domain/bloc/filter_category_bloc/filter_bloc.dart';
import 'package:fake_store/feature/product/domain/bloc/filter_category_bloc/filter_event.dart';
import 'package:fake_store/feature/product/domain/bloc/filter_category_bloc/filter_state.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_bloc.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_event.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_state.dart';
import 'package:fake_store/feature/product/presentation/widgets/product_item.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  late final FilterBloc blocFilter = context.read<FilterBloc>();
  late final ProductsListBloc blocProductsList =
      context.read<ProductsListBloc>();
  final controller = ScrollController();
  ValueNotifier currentCategories = ValueNotifier('');
  @override
  void initState() {
    super.initState();
    blocFilter.add(GetCategories());
    blocProductsList.add(PaginationProducts(keyCategory: ''));
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {

          blocProductsList.add(PaginationProducts(keyCategory: currentCategories.value));
      } 
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCollection.background,
        excludeHeaderSemantics: false,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Список товара:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        controller: controller,
        child: ValueListenableBuilder(
            valueListenable: currentCategories,
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _categoryBuilder,
                  const SizedBox(
                    height: 10,
                  ),
                  _listProducts
                ],
              );
            }),
      ),
    );
  }

  Widget get _listProducts => SizedBox(
        child: BlocBuilder<ProductsListBloc, ProductsListState>(
            bloc: blocProductsList,
            builder: (context, state) {
              return switch (state) {
                LoadingProductState() => Container(
                    width: 10,
                    height: 10,
                  ),
                UpdateProductState(:final productsList) => RefreshIndicator(
                    onRefresh: () async {},
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < productsList.length) {
                          return ProductItem(
                            product: productsList[index],
                          );
                        } else {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: state.isFull
                                  ? const Text('The end')
                                  : const CircularProgressIndicator(
                                      color: ColorCollection.primary,
                                      strokeWidth: 2,
                                    ),
                            ),
                          );
                        }
                      },
                      itemCount: productsList.length + 1,
                    ),
                  ),
                UpdateProductItemState() => Container(),

              };
            }),
      );
  Widget get _categoryBuilder => SizedBox(
        height: 50,
        child: BlocBuilder<FilterBloc, FilterState>(
            bloc: blocFilter,
            builder: (context, state) {
              return switch (state) {
                LoadingFilterState() => Container(
                    width: 10,
                    height: 10,
                  ),
                UpdateFilterState(
                  :final currentCategoriesMap,
                  :final currentCategoriesList
                ) =>
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ChoiceChip(
                        label: Text(currentCategoriesList[index]),
                        onSelected: (bool value) {
                          if(value) {
                            log('category');
                            currentCategories.value =
                              currentCategoriesList[index];
                             blocProductsList.add(PaginationProducts(keyCategory: currentCategories.value));
                          } else {
                            log('pogination');

                            currentCategories.value ='';
                            blocProductsList.add(PaginationProducts(keyCategory: ''));
                          };
                          
                        
                          blocFilter.add(
                              EditCategory(index: index, isSelected: value));
                        },
                        selected:
                            currentCategoriesMap[currentCategoriesList[index]]!,
                      );
                    },
                    // Corrected line with closing parenthesis
                    itemCount: currentCategoriesList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 10,
                    ),
                  ),
              };
            }),
      );
}

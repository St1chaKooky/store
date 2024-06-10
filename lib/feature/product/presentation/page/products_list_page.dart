import 'package:fake_store/feature/product/domain/filter_category/filter_bloc.dart';
import 'package:fake_store/feature/product/domain/filter_category/filter_event.dart';
import 'package:fake_store/feature/product/domain/filter_category/filter_state.dart';
import 'package:fake_store/feature/product/presentation/widgets/product_item.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  late final FilterBloc bloc = context.read<FilterBloc>();
          
  @override
  void initState()  {
    super.initState();
    bloc.add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCollection.background,
        excludeHeaderSemantics : false,
        automaticallyImplyLeading : false,
        centerTitle: true,
        title:  Text('Список товара:',  style: Theme.of(context).textTheme.titleMedium,),
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _categoryBuilder,
            const SizedBox(
              height: 10,
            ),
            _listProducts
          ],
        ),
      ),
    );
  }

  Widget get _listProducts => SizedBox(
  
    child: ListView.separated(
      separatorBuilder:  (BuildContext context, int index) => SizedBox(height: 10,),
      physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
      scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) => ProductItem(),
          
          itemCount:8,
        ),
  );
  Widget get _categoryBuilder => SizedBox(
              height: 50,
              child: BlocBuilder<FilterBloc, FilterState>(
                  bloc: bloc,
                  builder: (context, state) {
                    
                    return switch(state) {
                      LoadingState() => Container(
                        width: 10,
                        height: 10,
                      ),
                      UpdateState(:final currentCategoriesMap, :final currentCategoriesList) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ChoiceChip(
                            label: Text(currentCategoriesList[index]),
                            onSelected: (bool value) {
                              bloc.add(EditCategory(index: index, isSelected: value));
                            },
                            selected: currentCategoriesMap[currentCategoriesList[index]]!,
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

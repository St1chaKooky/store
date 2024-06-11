import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_bloc.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_event.dart';
import 'package:fake_store/feature/product/domain/bloc/products_list_bloc/products_list_state.dart';
import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late final ProductsListBloc bloc = context.read<ProductsListBloc>();

  @override
  void initState() {
    bloc.add(GetProductItem(id: int.parse(widget.id)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add_shopping_cart_sharp,color: ColorCollection.text))
        ],
        leading: context.canPop()
            ? IconButton(
                onPressed: () {
                  bloc.add(PaginationProducts());
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_outlined, color: ColorCollection.text,))
            : const SizedBox.shrink(),
        backgroundColor: ColorCollection.background,
        excludeHeaderSemantics: false,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Выбранный продукт',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: BlocBuilder<ProductsListBloc, ProductsListState>(
            bloc: bloc,
            builder: (context, state) {
              return switch (state) {
                UpdateProductItemState(:final product) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorCollection.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(9),
                        width: double.infinity,
                        height: 250,
                        child: Center(
                          child: Image.network(
                            product.image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Цена: ' + product.price.toString() + '\$',
                        style: Theme.of(context).textTheme.titleLarge,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Рейтинг: ${product.rating.rate}',
                      ),
                      Text('Продано: ${product.rating.count}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(product.description),
                    ],
                  ),
                LoadingProductState() => Container(),
                UpdateProductState() => Container(),
                // TODO: Handle this case.
                UpdateCategoryProductState() => Container(),
              };
            }),
      ),
    );
  }
}

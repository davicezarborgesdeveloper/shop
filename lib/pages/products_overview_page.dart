import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/component/product_item.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (ctx, i) {
            return ProductItem(product: loadedProducts[i]);
          }),
    );
  }
}

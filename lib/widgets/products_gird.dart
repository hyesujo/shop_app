import 'package:flutter/material.dart';
import 'package:my_shop/providers/productsprovider.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
final bool showFavs;

ProductsGrid(this.showFavs);


  @override
  Widget build(BuildContext context) {
   final productsData = Provider.of<Products>(context);
   final produsts = showFavs ? productsData.favoriteItems: productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: produsts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10),
       itemBuilder: (ctx, i) =>ChangeNotifierProvider.value(
         value:produsts[i],
         child:ProductItem(
        //  produsts[i].id,
        //  produsts[i].title,
        //  produsts[i].imageUrl,)
          ),
       ));
  }
}
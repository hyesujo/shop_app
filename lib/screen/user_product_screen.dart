
import 'package:flutter/material.dart';
import 'package:my_shop/providers/productsprovider.dart';
import 'package:my_shop/screen/edit_product_screen.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:my_shop/widgets/user_prouct_item.dart';
import 'package:provider/provider.dart';


class UserProductScreen extends StatelessWidget {
 static const routeName = '/user-products';

 Future<void> _refreshProduct(BuildContext context) async {
 await Provider.of<Products>(context).fetchAndSetProducts();
 }

  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.add), 
            onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            })
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
              onRefresh: () => _refreshProduct(context),
              child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_,i)=> 
            Column(
              children: <Widget>[
                UserProductItem(
                  productsData.items[i].id,
                  productsData.items[i].title,
                 productsData.items[i].imageUrl),
              Divider(),
              ],
            ),
            ),
          ),
      ),
    );
  }
}


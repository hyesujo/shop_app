import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/product.dart';
import 'package:my_shop/screen/product_detail_screen.dart';
import 'package:provider/provider.dart';


class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
 
  // const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
  final product = Provider.of<Product>(context, listen : false);
  final cart = Provider.of<Cart>(context, listen : false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
            child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
              arguments: product.id);
            },
                    child: Image.network(
              product.imageUrl,
               fit: BoxFit.cover),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black38,
            leading: Consumer<Product>(
     builder: (context, product,child) =>
     IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border
              ), 
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
              ),),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart
              ),
               onPressed: () {
                cart.addItem(product.id, 
                product.price, 
                product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Added item to Cart!',
                 ),
                  backgroundColor: Colors.blueGrey[900],
                  action: SnackBarAction(
                    label: 'UNDO', 
                    onPressed: () {
                    cart.removeItem(product.id);
                    }),
                  duration: Duration(seconds: 1),
                  ));
               },
                color: Theme.of(context).accentColor,
               ),
              
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
}

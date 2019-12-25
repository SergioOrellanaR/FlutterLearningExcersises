import 'package:bloc_forms/src/blocs/Provider.dart';
import 'package:bloc_forms/src/models/ProductModel.dart';
import 'package:bloc_forms/src/providers/ProductsProvider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final productsProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: _loadListFromFirebase(),
      floatingActionButton: _createButton(context),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, "product"),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  _loadListFromFirebase() {
    return FutureBuilder(
      future: productsProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) => _buildItem(context, products[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildItem(BuildContext context, ProductModel product) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        productsProvider.deleteProduct(product.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            (product.photoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : _fadeInImage(product),
            ListTile(
              title: Text("${product.title} - ${product.value}"),
              subtitle: Text(product.id),
              onTap: () =>
                  Navigator.pushNamed(context, "product", arguments: product),
            ),
          ],
        ),
      ),
      // child: ListTile(
      //   title: Text("${product.title} - ${product.value}"),
      //   subtitle: Text(product.id),
      //   onTap: () => Navigator.pushNamed(context, "product", arguments: product),
      // ),
    );
  }

  FadeInImage _fadeInImage(ProductModel product) {
    return FadeInImage(
      image: NetworkImage(product.photoUrl),
      placeholder: AssetImage("assets/camera_loading.gif"),
      height: 300.0,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

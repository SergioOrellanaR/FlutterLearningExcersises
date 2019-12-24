import 'dart:convert';

import 'package:bloc_forms/src/models/ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
  final String _url = "https://flutter-learning-fb.firebaseio.com";

  Future<bool> createProduct(ProductModel product) async {
    String urlExtension = "/Products.json";
    final productUrl = '$_url' + urlExtension;

    http.Response response =
        await http.post(productUrl, body: productModelToJson(product));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    String urlExtension = "/Products.json";
    final productUrl = '$_url' + urlExtension;

    http.Response response = await http.get(productUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      final List<ProductModel> products = new List();

      if (decodedData != null) 
      {
        decodedData.forEach((id, value) {
          ProductModel productTemp = ProductModel.fromJson(value);
          productTemp.id = id;

          products.add(productTemp);
        });
      }

      return products;

    } else {
      return [];
    }
  }

  Future<bool> deleteProduct( String id ) async
  {
    bool operationSucceed = false;


    //Se agrega el Id del elemento a borrar
    String urlExtension = "/Products/$id.json";
    final productUrl = '$_url' + urlExtension;
    
    http.Response response = await http.delete(productUrl);

    if(response.statusCode == 200)
    {
      operationSucceed = true;
    }
    
    return operationSucceed;

  }
}

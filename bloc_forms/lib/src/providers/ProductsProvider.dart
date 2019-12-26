import 'dart:convert';
import 'dart:io';

import 'package:bloc_forms/src/models/ProductModel.dart';
import 'package:bloc_forms/src/userPreferences/userPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

//Providers normalmente contienen CRUD

class ProductsProvider {
  final String _url = "https://flutter-learning-fb.firebaseio.com";
  final _prefs = new UserPreferences();

  Future<bool> createProduct(ProductModel product) async {
    String urlExtension = "/Products.json";
    String tokenExtension = "?auth=${_prefs.token}";

    final productUrl = '$_url' + urlExtension + tokenExtension;

    http.Response response =
        await http.post(productUrl, body: productModelToJson(product));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    String urlExtension = "/Products.json";
    String tokenExtension = "?auth=${_prefs.token}";

    final productUrl = '$_url' + urlExtension + tokenExtension;

    http.Response response = await http.get(productUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      final List<ProductModel> products = new List();

      if (decodedData != null) {
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

  Future<bool> deleteProduct(String id) async {
    bool operationSucceed = false;
    String tokenExtension = "?auth=${_prefs.token}";    
    

    //Se agrega el Id del elemento a borrar
    String urlExtension = "/Products/$id.json";
    final productUrl = '$_url' + urlExtension + tokenExtension;

    http.Response response = await http.delete(productUrl);

    if (response.statusCode == 200) {
      operationSucceed = true;
    }

    return operationSucceed;
  }

  Future<bool> updateProduct(ProductModel product) async {
    String urlExtension = "/Products/${product.id}.json";
    String tokenExtension = "?auth=${_prefs.token}"; 
    
    final productUrl = '$_url' + urlExtension + tokenExtension;

    http.Response response =
        await http.put(productUrl, body: productModelToJson(product));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/dwpt82kgy/image/upload?upload_preset=zjhxoxxd");

    final mimeType = mime(image.path).split("/");

    final imageUploadRequest = http.MultipartRequest("POST", url);

    final file = await http.MultipartFile.fromPath("file", image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      return responseData["secure_url"];
    } else {
      return null;
    }
  }
}

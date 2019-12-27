import 'dart:io';

import 'package:bloc_forms/src/models/ProductModel.dart';
import 'package:bloc_forms/src/providers/ProductsProvider.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc
{
  final _productsController = new BehaviorSubject<List<ProductModel>>();
  final _loadingController = new BehaviorSubject<bool>();

  final _productsProvider = new ProductsProvider();

  Stream<List<ProductModel>> get productsStream => _productsController.stream;
  Stream<bool> get loading => _loadingController.stream;

  void loadProducts() async
  {
    final products = await _productsProvider.loadProducts();
    _productsController.sink.add(products);
  }

  void createProduct(ProductModel product) async
  {
    _loadingController.sink.add(true);
    await _productsProvider.createProduct(product);
    _loadingController.sink.add(false);
  }

  Future<String> uploadPhoto(File photo) async
  {
    _loadingController.sink.add(true);
    final photoUrl = await _productsProvider.uploadImage(photo);
    _loadingController.sink.add(false);
    return photoUrl;
  }

  void updateProduct(ProductModel product) async
  {
    _loadingController.sink.add(true);
    await _productsProvider.updateProduct(product);
    _loadingController.sink.add(false);
  }

  void deleteProduct(String id) async
  {
    await _productsProvider.deleteProduct(id);
  }

  void dispose() { 
    _productsController?.close();
    _loadingController?.close();
  }


  
}
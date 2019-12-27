import 'package:flutter/material.dart';
import 'package:bloc_forms/src/blocs/LoginBloc.dart';
export 'package:bloc_forms/src/blocs/LoginBloc.dart';
import 'package:bloc_forms/src/blocs/ProductsBloc.dart';
export 'package:bloc_forms/src/blocs/ProductsBloc.dart';


class Provider extends InheritedWidget {
  static Provider _instance;
  final _loginBloc    = LoginBloc();
  final _productsBloc = ProductsBloc();

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }

    return _instance;
  }

  Provider._internal({Key key, Widget child})
   : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._loginBloc;
  }

  static ProductsBloc productsBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._productsBloc;
  }



}

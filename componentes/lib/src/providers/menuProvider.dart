import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider
{
  List options = [];

  _MenuProvider()
  {
    //loadData();
  }

  Future<List<dynamic>> loadData() async
  {

    final data = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(data);
    //Map rutas = dataMap["rutas"];
    options = dataMap["rutas"];
    return options;


  }

}

final menuProvider = new _MenuProvider();
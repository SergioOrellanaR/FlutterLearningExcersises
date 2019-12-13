import 'package:flutter/material.dart';

import 'package:contador/src/pages/contadorPage.dart';

class MyApp extends StatelessWidget
{
  @override
  Widget build(context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: new ContadorPage(),
      ),
      color: Colors.blue,
    );
  }
}
import 'package:bloc_forms/src/blocs/Provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Email: ${bloc.getEmail}"),
          //El divider centra, wtf
          Divider(),
          Text("Password: ${bloc.getPassword}")
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:bloc_forms/src/blocs/Provider.dart';
import 'package:bloc_forms/src/models/ProductModel.dart';

import 'package:bloc_forms/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductsBloc productsBloc;
  ProductModel product = new ProductModel();
  bool _saving = false;
  File photo;

  @override
  Widget build(BuildContext context) {
    productsBloc = Provider.productsBloc(context);

    final ProductModel productData = ModalRoute.of(context).settings.arguments;

    if (productData != null) {
      product = productData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(),
      body: _appBarBody(),
    );
  }

  SingleChildScrollView _appBarBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: _form(),
      ),
    );
  }

  Form _form() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          _showPhoto(),
          _createProduct(),
          _createPrice(),
          _createAvailable(),
          SizedBox(
            height: 40.0,
          ),
          _createButton()
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text("ProductPage"),
      actions: _actions(),
    );
  }

  List<Widget> _actions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.photo_size_select_actual),
        onPressed: () => selectPhoto(ImageSource.gallery),
      ),
      IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: () => selectPhoto(ImageSource.camera),
      ),
    ];
  }

  TextFormField _createProduct() {
    //Trabaja directamente con el formulario
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: "Product"),
      onSaved: (value) => product.title = value,
      validator: (value) {
        if (value.length < 3) {
          return "Ingrese nombre válido";
        } else {
          //Retur null significa que es válido
          return null;
        }
      },
    );
  }

  TextFormField _createPrice() {
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: "Price"),
      //Se dispara solo a la hora a guardar desde el botón.
      onSaved: (value) => product.value = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return "Ingrese solo números UwU";
        }
      },
    );
  }

  _createButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text("Guardar"),
      icon: Icon(Icons.save),
      onPressed: (_saving) ? null : _submit,
    );
  }

  _createAvailable() {
    return SwitchListTile(
      value: product.isAvailable,
      title: Text("Disponible"),
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        setState(() {
          product.isAvailable = value;
        });
      },
    );
  }

  void _submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      String message;

      setState(() {
        _saving = true;
      });

      if (photo != null) {
        product.photoUrl = await productsBloc.uploadPhoto(photo);
      }

      if (product.id == null) {
        productsBloc.createProduct(product);
        message = "Registro creado";
      } else {
        productsBloc.updateProduct(product);
        message = "Registro actualizado";
      }

      Navigator.pop(context);

      showSnackBar(message);
    } else {
      //Cuando sea inválido
      return;
    }
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  selectPhoto(ImageSource source) async {
    photo = await ImagePicker.pickImage(source: source);

    if (photo != null) {
      product.photoUrl = null;
    }

    setState(() {});
  }

  _showPhoto() {
    if (product.photoUrl != null) {
      return FadeInImage(
        image: NetworkImage(product.photoUrl),
        placeholder: AssetImage("assets/camera_loading.gif"),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      if (photo == null) {
        return Image(
          //Si foto tiene un valor muestra el path, pero si viene null, muestra el de los assets
          image: AssetImage(photo?.path ?? "assets/no-image.png"),
          height: 300.0,
          fit: BoxFit.cover,
        );
      } else {
        return Image.file(photo, height: 300.0, fit: BoxFit.cover);
      }
    }
  }
}

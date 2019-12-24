import 'package:bloc_forms/src/models/ProductModel.dart';
import 'package:bloc_forms/src/providers/ProductsProvider.dart';
import 'package:bloc_forms/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override void initState() { super.initState();}

  final formKey = GlobalKey<FormState>();

  ProductModel product = new ProductModel();
  ProductsProvider productProvider = new  ProductsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            _createProduct(),
            _createPrice(),
            _createAvailable(),
            SizedBox(height: 40.0,),
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
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: () {},
      ),
    ];
  }

  TextFormField _createProduct() 
  {
    //Trabaja directamente con el formulario
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: "Product"
      ),
      onSaved: (value)=> product.title = value,
      validator: (value)
      {
        if(value.length<3)
        {
          return "Ingrese nombre válido";
        }
        else
        {
          //Retur null significa que es válido
          return null;
        }
      },
    );
  }

  TextFormField _createPrice() 
  {
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Price"
      ),
      //Se dispara solo a la hora a guardar desde el botón.
      onSaved: (value)=> product.value = double.parse(value),
      validator: (value)
      {
        if(utils.isNumeric(value))
        {
          return null;
        }
        else
        {
          return "Ingrese solo números UwU";
        }
      },
    );
  }

  _createButton() 
  {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text("Guardar"),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  _createAvailable() 
  {
    return SwitchListTile(
      value: product.isAvailable,
      title: Text("Disponible"),
      activeColor: Colors.deepPurple,
      onChanged: (value)
      {
        setState(() {
          product.isAvailable = value;
        });
      },
    );
  }

  void _submit() 
  {
    if( formKey.currentState.validate() )
    {
      formKey.currentState.save();
      productProvider.createProduct(product);

    }
    else
    {
      //Cuando sea inválido
      return;
    }
  }
}

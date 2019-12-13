import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _birthdate = "";
  List<String> _hairColor = ["RedHead", "Blonde", "Dark", "Green"];
  String _selectedItem = "RedHead";

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (Text("Inputs"))),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createBirthdate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      enabled: true,
      maxLength: 50,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: _decoration(_name, "Nombre", Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text("Nombre es: $_name"),
      subtitle: Text("Email es: $_email"),
      trailing: Text(_selectedItem),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      enabled: true,
      maxLength: 50,
      decoration: _decoration(_email, "Email", Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        enabled: true,
        maxLength: 50,
        decoration: _decoration(_password, "Password", Icon(Icons.security)),
        onChanged: (value) => setState(() {
              _password = value;
            }));
  }

  Widget _createBirthdate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      enabled: true,
      maxLength: 50,
      decoration: _decoration(
          _birthdate, "Fecha de nacimiento", Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        selectDate(context);
      },
    );
  }

  InputDecoration _decoration(String text, String field, Icon icon) {
    return InputDecoration(
        counter: Text("Letras ${text.length}"),
        hintText: "$field de persona",
        labelText: "$field",
        helperText: "Ingrese ${field.toLowerCase()} de persona",
        suffixIcon: Icon(Icons.keyboard),
        icon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)));
  }

  void selectDate(BuildContext context) async {
    DateTime dateTimePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1, 1),
        lastDate: DateTime(2020),
        locale: Locale("es", "CL"));

    if (dateTimePicker != null) {
      setState(() {
        String formattedDate = DateFormat('dd-MM-yyyy').format(dateTimePicker);
        _birthdate = formattedDate;
        _inputFieldDateController.text = _birthdate;
      });
    }
  }

  Row _createDropdown() {
    List<DropdownMenuItem<String>> values = getDdlOptions();

    return Row(
      children: <Widget>[
        Icon(Icons.details),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _selectedItem,
            items: values,
            onChanged: (selectedItem) {
              setState(() {
                _selectedItem = selectedItem;
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getDdlOptions() {
    List<DropdownMenuItem<String>> list = new List();

    for (String item in _hairColor) {
      DropdownMenuItem<String> ddlItem =
          new DropdownMenuItem(value: item, child: Text(item));
      list.add(ddlItem);
    }

    return list;
  }
}

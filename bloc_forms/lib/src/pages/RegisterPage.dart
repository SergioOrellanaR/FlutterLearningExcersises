import 'package:bloc_forms/src/blocs/LoginBloc.dart';
export 'package:bloc_forms/src/blocs/LoginBloc.dart';
import 'package:bloc_forms/src/blocs/Provider.dart';
import 'package:bloc_forms/src/providers/UserProvider.dart';
import 'package:bloc_forms/src/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final UserProvider userProvider = new UserProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_setBackground(context), _loginInformation(context)],
      ),
    );
  }

  _purpleBackgroundSquare(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0),
        ]),
      ),
    );
  }

  _setCircleSettings({double top, double left, double right, double bottom}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(90, 70, 178, 1.0),
        ),
      ),
    );
  }

  _loginInformation(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: SizedBox(
            height: 60.0,
          ),
        ),
        _mainIcon(),
        SizedBox(
          height: 15.0,
          width: double.infinity,
        ),
        _nameAppText(),
        _loginBoxInformation(context),
        _signUp(context)
      ],
    );
  }

  _mainIcon() {
    return Icon(
      Icons.person_pin_circle,
      color: Colors.white,
      size: 100.0,
    );
  }

  _nameAppText() {
    TextStyle style = TextStyle(
        color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.normal);
    return Text(
      "Sergio Orellana Login App",
      style: style,
    );
  }

  _loginBoxInformation(BuildContext context) {
    final bloc = Provider.of(context);
    final screenSize = MediaQuery.of(context).size;
    //Con el expanded se auto ajusta con el teclado
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: screenSize.width * 0.85,
              padding: EdgeInsets.symmetric(vertical: 50.0),
              margin: EdgeInsets.symmetric(vertical: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0,
                      blurRadius: 3.0)
                ],
              ),
              child: Column(children: <Widget>[
                Text("Crear cuenta", style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 60.0,
                ),
                _createEmail(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _createPassword(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _createButton(bloc)
              ]),
            ),
          ],
        ),
      ),
    );
  }

  _setBackground(BuildContext context) {
    return Stack(children: <Widget>[
      _purpleBackgroundSquare(context),
      _setCircleSettings(top: 90.0, left: 30.0),
      _setCircleSettings(top: -40.0, right: -30.0),
      _setCircleSettings(bottom: -50.0, right: -10.0),
      _setCircleSettings(bottom: 120.0, right: 20.0),
      _setCircleSettings(bottom: -50.0, left: -20.0),
    ]);
  }

  _createEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepPurple,
                ),
                hintText: "ejemplo@email.com",
                labelText: "Email",
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  _createPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: Colors.deepPurple,
                ),
                labelText: "Password",
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  _createButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          color: Colors.deepPurple,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              "Ingresar",
              style: TextStyle(color: Colors.white),
            ),
          ),
          shape: StadiumBorder(),
          onPressed: snapshot.hasData ? () => _register(bloc, context) : null,
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async{
    final info = await userProvider.createUser(bloc.getEmail, bloc.getPassword);

    if(info["ok"])
    {
      Navigator.pushReplacementNamed(context, "home");
    }
    else
    {
      showAlert(context, info["message"]);
    }
    
    // Navigator.pushReplacementNamed(context, 'home');
  }

  _signUp(BuildContext context) {
    return FlatButton(
      child: Text("Regresar"),
      onPressed: () => Navigator.pushReplacementNamed(context, "login"),
    );
  }
}

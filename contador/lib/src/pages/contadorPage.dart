import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _textStyle = new TextStyle(fontSize: 25.0);

  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Este es un título"),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Número de clicks: ", style: _textStyle),
            Text('$_contador', style: _textStyle),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _createButtons(),
    );
  }

  Widget _createButtons() {
    return _createOperationButtons();
  }

  Widget _createOperationButtons() {
    FloatingActionButton addButon = new FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _add,
    );

    FloatingActionButton subtractButon = new FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: _subtract,
    );

    return Column(
      children: <Widget>[
        SizedBox(
          height: 130.0,
        ),
        addButon,
        SizedBox(
          height: 10.0,
        ),
        subtractButon,
        Expanded(child: SizedBox()),
        _createResetButton()
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Widget _createResetButton() {
    FloatingActionButton resetButton =
        new FloatingActionButton(child: Icon(Icons.undo), onPressed: _reset);

    return resetButton;
  }

  void _add() {
    setState(() => _contador++);
  }

  void _subtract() {
    setState(() 
    {
      if(_contador>0)
        _contador--;
    } );
  }

  void _reset() {
    setState(() => _contador = 0);
  }
}

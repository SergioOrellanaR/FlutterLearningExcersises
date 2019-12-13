import 'package:componentes/src/routes/nekoRouteImage.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 325.0;
  bool _isSelected = true;
  bool _isSelectedSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            // Expanded(
            //   child: _createImage()
            //   ),
            _createImage()
          ],
        ),
        padding: EdgeInsets.only(top: 30.0),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      min: 100.0,
      max: 550.0,
      value: _sliderValue,
      onChanged: (_isSelected)
          ? (value) => setState(() {
                _sliderValue = value;
              })
          : null,
      activeColor: Colors.indigoAccent,
      label: "Tamaño de imagen :P",
      //divisions: 10,
    );
  }

  Widget _createImage() {
    return Image(
      image: routeNeko()["RedDressed"],
      height: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   onChanged: (val) {
    //     setState(() {
    //       _isSelected = val;
    //     });
    //   },
    //   value: _isSelected,
    // );

    return CheckboxListTile(
      onChanged: (val) {
        setState(() {
          _isSelected = val;
        });
      },
      value: _isSelected,
      title: Text("Activar slider"),
    );
  }

  Widget _createSwitch() 
  {
    return SwitchListTile(
      onChanged: (val) {
        setState(() {
          _isSelectedSwitch = val;
        });
      },
      value: _isSelectedSwitch,
      title: Text("Switch value"),
      
    );
  }
}

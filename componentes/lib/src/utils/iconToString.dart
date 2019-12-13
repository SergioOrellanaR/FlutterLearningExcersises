import 'package:flutter/material.dart';

final _icons = <String, IconData>
{
  "add_alert"       : Icons.add_alert,
  "accessibility"   : Icons.accessibility,
  "pets"            : Icons.pets
};

final _colorIcons = <String, Color>
{
  "Red"   : Colors.red,
  "Blue"  : Colors.blue,
  "Orange": Colors.orangeAccent
};


Icon getIcon(String iconName, String paramColor)
{
  Color color = _colorIcons[paramColor];

  return Icon(_icons[iconName], color: color);
}
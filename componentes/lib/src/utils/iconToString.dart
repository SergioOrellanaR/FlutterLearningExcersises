import 'package:flutter/material.dart';

final _icons = <String, IconData>
{
  "add_alert"                   : Icons.add_alert,
  "accessibility"               : Icons.accessibility,
  "pets"                        : Icons.pets,
  "star"                        : Icons.grade,
  "input"                       : Icons.input,
  "slideshow"                   : Icons.slideshow,
  "format_list_bulleted"        : Icons.format_list_bulleted
};

final _colorIcons = <String, Color>
{ 
  "Red"       : Colors.red,
  "Blue"      : Colors.blue,
  "Grey"      : Colors.grey,
  "Yellow"    : Colors.orangeAccent,
  "Black"     : Colors.black,
  "Purple"    : Colors.deepPurpleAccent,
  "Lightblue" : Colors.lightBlue
};


Icon getIcon(String iconName, String paramColor)
{
  Color color = _colorIcons[paramColor];

  return Icon(_icons[iconName], color: color);
}
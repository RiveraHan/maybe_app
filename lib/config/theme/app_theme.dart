import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF7712A5);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.pink,
  Colors.green,
  Colors.indigo,
  Colors.deepOrange
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0 && selectColor <= _colorTheme.length - 1,
            'No puede ser mayor a ${_colorTheme.length - 1} ni menor a 0');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectColor],
      // brightness: Brightness.dark
    );
  }
}

import 'package:flutter/material.dart';

class CalendarStyle {
  final Color selectedColor;
  final Color todayColor;
  final Color defaultColor;
  final TextStyle textStyle;

  const CalendarStyle({
    this.selectedColor = Colors.teal,
    this.todayColor = Colors.orange,
    this.defaultColor = Colors.grey,
    this.textStyle = const TextStyle(fontSize: 16),
  });
}
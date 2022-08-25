import 'package:flutter/material.dart';
import '../widgets/auth/form_widget.dart';


abstract class AppButtonStyle {
  static final linkButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
}
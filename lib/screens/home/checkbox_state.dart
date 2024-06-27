import 'package:flutter/src/painting/text_style.dart';

class CheckBoxState {
  final String title;
  bool value;
  CheckBoxState({
    required this.title,
    this.value = false,
  });
}

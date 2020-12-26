import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // final regEx = RegExp("^[0-9][0-9]*[.]?[0-9]{0,3}");
    final regEx = RegExp(r'^(\d+)?\.?\d{0,2}');
    String newString = regEx.stringMatch(newValue.text) ?? "";
    return newString == newValue.text ? newValue : oldValue;
  }
}

import 'package:flutter/material.dart';

extension CustomSizeBox on int {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension DismisskeyBoard on BuildContext {
  void dismissKeyBoard(){
    FocusScope.of(this).unfocus();
  }
}
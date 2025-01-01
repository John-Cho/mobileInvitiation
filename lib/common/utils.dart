import 'package:flutter/material.dart';

import 'constans.dart';

class Utils {
  static Widget CrossText(String text, {TextStyle? style}) {
    return Column(
      children: text.split('').map((e) {
        return Text(e, style: style ?? DEFAULT_TEXT_STYLE,);
      },).toList(),
    );
  }

  static Widget transformText(String text, {TextStyle? style}){
    return Transform.rotate(
      angle: -1.57,
      child: Text(text, style: style ?? DEFAULT_TEXT_STYLE,),
    );
  }
}
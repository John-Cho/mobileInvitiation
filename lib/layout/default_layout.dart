import 'package:flutter/material.dart';
import 'package:mobileinvitiation/common/constans.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  final Widget body;

  const DefaultLayout({
    Key? key,
    this.backgroundColor,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        appBar: AppBar(
          title:Text(title),
          centerTitle: true,
          backgroundColor: backgroundColor,
          titleTextStyle: TextStyle(
            fontFamily: FONT_FAMILY,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: DEFAULT_TEXT_COLOR,
          ),
        ),
        body: body,
      ),
    );
  }
}

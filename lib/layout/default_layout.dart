import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: this.body,
    );
  }
}

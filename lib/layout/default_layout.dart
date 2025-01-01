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
        body: this.body,
      ),
    );
  }
}

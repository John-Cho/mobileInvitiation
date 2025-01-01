import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileinvitiation/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(child: _App()));
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nanum_Myeongjo',
      ),
      home: HomeScreen(),
    );
  }
}

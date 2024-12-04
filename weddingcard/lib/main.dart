import 'package:flutter/material.dart';
import 'package:weddingcard/common/view/main_view.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: Scaffold(
        body: Center(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600, minWidth: 400),
                child: Stack(
                  children: [
                    MainView(title: '청첩장'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Opacity(opacity: 0.5, child: Icon(Icons.arrow_forward_ios, size: 50, color: Colors.grey,),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Opacity(opacity: 0.5, child: Icon(Icons.arrow_back_ios, size: 50, color: Colors.grey,),),
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}

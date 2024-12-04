import 'package:flutter/material.dart';
import 'package:weddingcard/common/const/constants_value.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          renderTop('조재우 · 김예경'),
          const SizedBox(height: 16.0),
          Image.asset('asset/img/wedding_intro.jpg'),
          const SizedBox(height: 16.0),
          renderText('<일정>\n2025년 3월 15일 토요일 오후 2시'),
          const SizedBox(height: 16.0),
          renderText('<장소>\n노블발렌티 대치점 '),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              height: 2.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16.0),
          renderIntroText(),
        ],
      ),
    );
  }

  renderTop(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: FONTSZ_SUBTITLE,
          fontWeight: FontWeight.w800,
          color: Colors.black87),
    );
  }

  renderText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: FONTSZ_TEXT,
          fontWeight: FontWeight.w500,
          color: FONT_COLOR_TEXT),
      textAlign: TextAlign.center,
    );
  }

  String contents_text = '''서로가 마주보며 다져온 사랑을
  이제 함께 한 곳을 바라보며
  걸어갈 수 있는 큰 사랑으로
  키우고자 합니다.
  저희 두 사람이 사랑의 이름으로
  지켜나갈 수 있도록
  앞날을 축복해 주시면
  감사하겠습니다.
  ''';

  renderIntroText() {
    return Text(
      contents_text,
      style: TextStyle(
          fontSize: FONTSZ_TEXT,
          color: FONT_COLOR_TEXT,
          fontWeight: FontWeight.w300,
          height: 2.0),
      textAlign: TextAlign.center,
    );
  }
}

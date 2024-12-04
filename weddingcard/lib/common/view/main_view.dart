
import 'package:flutter/material.dart';
import 'package:weddingcard/common/const/constants_value.dart';
import 'package:weddingcard/home/view/home_view.dart';

class MainView extends StatefulWidget{
  final String title;

  const MainView({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin{
  // InitState 에서 초기화 한다.
  late TabController controller;
  // NavigationBar 와 TabBarView 연동을 위한 변수
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(TabListener);
  }

  // BottomNavigationBar 와 연동을 위한 Listener
  void TabListener(){
    setState(() {
      pageIndex = controller.index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title, style: const TextStyle(fontSize: FONTSZ_TITLE, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(child: HomeView()),
          Center(child: Container(child: Text('Gallery'),),),
          Center(child: Container(child: Text('Maps'),),),
          Center(child: Container(child: Text('Contact'),),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈',),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: '사진',),
          BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: '찾아오시는 길',),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: '연락처',),
        ],
        onTap: (value) {
          controller.index = value;
        },
      ),
    );
  }
}


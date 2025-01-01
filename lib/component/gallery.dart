import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> images = List.generate(
    9, // 총 이미지 개수
    (index) => 'asset/img/imgs/image${index + 1}.jpg', // 이미지 경로
  );

  GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: GestureDetector(
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return _ImagePageView(images: images, initialIndex: index);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ImagePageView extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const _ImagePageView({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Center(
            child: Hero(
                tag: images[index],
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                )),
          );
        },
      ),
    );
  }
}

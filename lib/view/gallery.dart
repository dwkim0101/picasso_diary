import 'package:flutter/material.dart';
import 'package:picasso_diary/view/gallery_card.dart';
import 'package:picasso_diary/view/gallery_detail.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  List<String> img = [
    'assets/imgs/image 1.png',
    'assets/imgs/image 6.png',
    'assets/imgs/image 7.png',
    'assets/imgs/image 8.png',
  ];

  List<String> title = [
    '르네상스',
    '바로크',
    '로코코',
    '인상주의',
  ];

  List<String> centuries = [
    '14c ~ 16c',
    '17c ~ 18c',
    '18c',
    '19c',
  ];

  List<String> description = [
    '유럽에서 발생한 문화·미술 운동\n고전 예술과 인간중심주의를\n되살리고자 하였다',
    '극적인 조명을 활용한 극적인\n묘사가 돋보이는 시기.\n종교보다는 인간의 감정, 세속적인\n가치와 상상력을 중시하였다.',
    '화려하고 색채, 섬세하고 우아한\n장식의 정점\n귀족과 부르주아를 위한 유희와\n쾌락 중심의 주제를 다룬다.',
    '전통적인 회화 기법을 거부하고\n색채와 색조, 질감을 주요시\n햇빛의 인상과 순간적 효과를\n포착하고자 하였다.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Art Museum',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // foreground: Paint()
            //   ..style = PaintingStyle.stroke
            //   ..strokeWidth = 6
            //   ..color = Colors.black,
          ),
        ),
        // titleTextStyle: const TextStyle(color: Colors.white),
        // forceMaterialTransparency: true,
        flexibleSpace: const Image(
          image: AssetImage('assets/imgs/back2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      body: ListView.builder(
        physics: const PageScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 13),
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GalleryDetail(
                        title: title[index],
                      ),
                    ),
                  );
                },
                child: buildRecipeCard(
                  img: img[index],
                  title: title[index],
                  description: description[index],
                  centuries: centuries[index],
                ),
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}

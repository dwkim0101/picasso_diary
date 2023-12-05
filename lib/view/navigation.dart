import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:picasso_diary/util/request.dart';
import 'package:picasso_diary/view/create_diary.dart';
import 'package:picasso_diary/view/explore_view.dart';
import 'package:picasso_diary/view/gallery.dart';
import 'package:picasso_diary/view/gallery_detail.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Picasso Diary'),
      // ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          const NavigationDestination(
            icon: Icon(Icons.explore),
            label: '탐색',
          ),
          const NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: '일기',
          ),
          NavigationDestination(
            // icon: Icon(Icons.photo_size_select_actual_outlined),
            icon: SvgPicture.asset(
              'assets/icons/Vector.svg',
              height: 25,
            ),
            label: '미술관',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person),
            label: '정보',
          ),
        ],
      ),
      body: [
        const ExploreView(),
        const CreateDiary(),
        const MyGallery(),
        const GalleryDetail(title: '정보'),
      ][currentPageIndex],
    );
  }
}

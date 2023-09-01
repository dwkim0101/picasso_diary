import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:picasso_diary/view/create_diary.dart';
import 'package:picasso_diary/view/explore_view.dart';
import 'package:picasso_diary/view/gallery.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
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
        ],
      ),
      body: [
        const ExploreView(),
        const CreateDiary(),
        const MyGallery(),
      ][currentPageIndex],
    );
  }
}

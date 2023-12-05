import 'package:flutter/material.dart';
import 'package:picasso_diary/util/request.dart';
import 'package:picasso_diary/view/explore_card.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          '당신의 순간들',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        // toolbarHeight: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedCard(num: 1, date: 20),
                  ElevatedCard(num: 2, date: 21),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedCard(num: 3, date: 22),
                  ElevatedCard(num: 4, date: 23),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedCard(num: 5, date: 24),
                  ElevatedCard(num: 6, date: 25),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedCard(num: 2, date: 26),
                  ElevatedCard(num: 3, date: 27),
                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       currentPageIndex = 1;
      //     });
      //   },
      //   tooltip: 'Submit',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

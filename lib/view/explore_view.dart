import 'package:flutter/material.dart';

class exploreView extends StatefulWidget {
  const exploreView({super.key});

  @override
  State<exploreView> createState() => _exploreViewState();
}

class _exploreViewState extends State<exploreView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      children: [
        ElevatedCardExample(),
        ElevatedCardExample(),
        ElevatedCardExample(),
        ElevatedCardExample(),
        ElevatedCardExample(),
        ElevatedCardExample(),
      ],
    ));
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 200,
            height: 200,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}

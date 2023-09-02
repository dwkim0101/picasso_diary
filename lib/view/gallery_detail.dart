import 'package:flutter/material.dart';

class GalleryDetail extends StatelessWidget {
  final String title;

  const GalleryDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'asd',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

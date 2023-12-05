import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevatedCard extends StatelessWidget {
  int num = 0;
  int date = 0;
  // const ElevatedCardExample({super.key});
  ElevatedCard({Key? key, required this.num, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            width: 170,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -5),
                    child: Text(
                      '$date',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(30, -5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/imgs/img$num.png',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

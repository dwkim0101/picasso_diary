import 'package:flutter/material.dart';

Widget buildRecipeCard({
  required String img,
  required String title,
  required String centuries,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              img,
              height: 100,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    centuries,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 10.5, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

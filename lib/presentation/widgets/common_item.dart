import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  const CommonItem(
      {super.key,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: Get.mediaQuery.size.width / 2 - 32,
            fit: BoxFit.fill,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "$price đ",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

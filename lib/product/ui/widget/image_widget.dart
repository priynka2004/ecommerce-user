import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? image;
  final BoxFit? fit;

  const CachedImage({required this.image, this.fit, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(color: Colors.black12),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}

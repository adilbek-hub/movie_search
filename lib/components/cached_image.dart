import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_search/components/loading_state.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width = 250,
    this.height = 280,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const LoadingState(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}

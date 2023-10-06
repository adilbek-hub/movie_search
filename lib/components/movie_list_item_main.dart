import 'package:flutter/material.dart';
import 'package:movie_search/components/cached_image.dart';
import 'package:movie_search/models/movie_model.dart';

class ListOfMoviesMain extends StatelessWidget {
  const ListOfMoviesMain({
    Key? key,
    required this.stat,
    required this.itemCount,
  }) : super(key: key);
  final MovieModel stat;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      primary: false,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        final movie = stat.data[index];
        return Column(
          children: [CachedImage(imageUrl: movie.coverUrl)],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_search/components/cached_image.dart';
import 'package:movie_search/theme/theme_export.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CachedImage(
                imageUrl: imageUrl,
                width: 150,
                height: 150,
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.filmTitleStyle,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      description,
                      style: AppTextStyle.filmDescriptionStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

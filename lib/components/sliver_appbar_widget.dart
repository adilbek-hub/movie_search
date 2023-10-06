import 'package:flutter/material.dart';
import 'package:movie_search/constants/api_const.dart';
import 'package:movie_search/theme/theme_export.dart';
import 'package:movie_search/components/component_export.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: AppColor.white,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedImage(imageUrl: ApiConst.movieBanner),
      ),
    );
  }
}

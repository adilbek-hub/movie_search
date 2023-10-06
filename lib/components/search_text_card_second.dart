import 'package:flutter/material.dart';
import 'package:movie_search/theme/theme_export.dart';

class SearchTextCard extends StatelessWidget {
  const SearchTextCard({
    Key? key,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.white06,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: AppText.searchMovies,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColor.orange,
          ),
          prefixIconColor: AppColor.white,
        ),
      ),
    );
  }
}

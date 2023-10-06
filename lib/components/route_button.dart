import 'package:flutter/material.dart';

import 'package:movie_search/theme/theme_export.dart';
import 'package:movie_search/view/searching_view.dart';

class RouteButton extends StatelessWidget {
  const RouteButton({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.red07,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.white08,
        ),
      ),
    );
  }
}

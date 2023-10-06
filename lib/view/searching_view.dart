import 'package:flutter/material.dart';
import 'package:movie_search/components/component_export.dart';
import 'package:movie_search/models/search_movie.dart';
import 'package:movie_search/theme/theme_export.dart';

class SearchingView extends StatefulWidget {
  const SearchingView({super.key});

  @override
  State<SearchingView> createState() => _SearchingViewState();
}

class _SearchingViewState extends State<SearchingView> {
  List<SearchMovie> dispayList = List.from(moviersList);
  void update(String value) {
    setState(() {
      dispayList = moviersList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: SafeArea(
        child: Column(
          children: [
            SearchTextCard(onChanged: (value) => update(value)),
            Expanded(
              child: dispayList.isEmpty
                  ? const Center(
                      child: Text(AppText.answer),
                    )
                  : ListView.builder(
                      itemCount: dispayList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = dispayList[index];
                        return MovieListItem(
                          title: movie.name,
                          description: movie.alternativeName,
                          imageUrl: movie.previewUrl,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: RouteButton(
        text: AppText.first,
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
    );
  }
}

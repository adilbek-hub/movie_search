import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/bloc/movie_bloc.dart';
import 'package:movie_search/theme/app_text.dart';
import 'package:movie_search/components/component_export.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      if (state is MovieLoading) {
        return const LoadingState();
      } else if (state is MovieSuccess) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: CustomScrollView(
            slivers: [
              const SliverAppBarWidget(),
              SliverToBoxAdapter(
                child: ListOfMoviesMain(
                  stat: state.movieModel,
                  itemCount: state.movieModel.data.length,
                ),
              )
            ],
          ),
          floatingActionButton: RouteButton(
            text: AppText.second,
            onPressed: () => Navigator.pushNamed(context, '/searchingView'),
          ),
        );
      } else if (state is MovieError) {
        return ErrorState(error: state.errorText);
      } else {
        return const Text(AppText.error);
      }
    });
  }
}

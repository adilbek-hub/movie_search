import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/bloc/movie_bloc.dart';
import 'package:movie_search/service/movie_service.dart';
import 'package:movie_search/view/movie_view.dart';
import 'package:movie_search/view/searching_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieBloc(movieService: movieService)..add(FetchMovieEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const MovieView(),
          "/searchingView": (context) => const SearchingView(),
        },
      ),
    );
  }
}

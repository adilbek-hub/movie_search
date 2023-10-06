import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/models/movie_model.dart';
import 'package:movie_search/service/movie_service.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required this.movieService}) : super(MovieLoading()) {
    on<MovieEvent>((event, emit) {});
    on<FetchMovieEvent>(_getMovie);
  }

  final MovieService movieService;

  Future<void> _getMovie(
      FetchMovieEvent event, Emitter<MovieState> emit) async {
    final data = await movieService.getData();
    if (data != null) {
      emit(MovieSuccess(movieModel: data));
    } else {
      emit(const MovieError(errorText: 'MovieError'));
    }
  }
}

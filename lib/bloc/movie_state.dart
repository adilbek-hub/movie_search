part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  const MovieSuccess({required this.movieModel});
  final MovieModel movieModel;
}

final class MovieError extends MovieState {
  const MovieError({required this.errorText});
  final String errorText;
}

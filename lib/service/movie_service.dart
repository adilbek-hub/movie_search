import 'package:http/http.dart' as http;
import 'package:movie_search/constants/api_const.dart';
import 'package:movie_search/models/movie_model.dart';

class MovieService {
  const MovieService({required this.client});
  final http.Client client;
  Future<MovieModel?> getData() async {
    try {
      final response = await http.get(Uri.parse(ApiConst.movieApi));

      if (response.statusCode == 200) {
        final data = movieModelFromJson(response.body);

        return data;
      } else {
        throw Exception('Failed to load computer data');
      }
    } catch (e) {
      throw Exception('Ошибка в КЕШ ${e.toString()}');
    }
  }
}

final movieService = MovieService(
  client: http.Client(),
);

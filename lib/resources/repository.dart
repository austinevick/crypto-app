import 'package:bloc_pattern/models/movie.dart';
import 'package:bloc_pattern/resources/movie_api_provider.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();

  Future<Movie> fetchAllmovies() => movieApiProvider.fetchMovieList();
}

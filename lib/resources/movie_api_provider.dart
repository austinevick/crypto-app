import 'dart:async';
import 'dart:convert';
import 'package:bloc_pattern/models/movie.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();
  final String url =
      'http://api.themoviedb.org/3/movie/popular?api_key=802b2c4b88ea1183e50e6b285a27696e';
  Future<Movie> fetchMovieList() async {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}

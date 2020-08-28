import 'package:bloc_pattern/models/movie.dart';
import 'package:bloc_pattern/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<Movie>();

  Stream<Movie> get allMovies => _moviesFetcher.stream;

  fetchAllmovies() async {
    Movie movie = await _repository.fetchAllmovies();
    _moviesFetcher.sink.add(movie);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();

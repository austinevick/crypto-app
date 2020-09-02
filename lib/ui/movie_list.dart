import 'package:bloc_pattern/blocs/movies_bloc.dart';
import 'package:bloc_pattern/models/movie.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllmovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildMovieList(snapshot);
            }
            return Center(
              child: LinearProgressIndicator(),
            );
          }),
    );
  }

  buildMovieList(AsyncSnapshot snapshot) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) => Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[i].poster_path}',
              fit: BoxFit.cover,
            ));
  }
}

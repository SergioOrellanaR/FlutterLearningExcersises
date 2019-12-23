import 'dart:async';
import 'dart:convert';

import 'package:peliculas_learning/src/models/ActorModel.dart';
import 'package:peliculas_learning/src/models/MovieModel.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = "bc0ebddecf9de597bca3a775c91fb0c4";
  String _url = "api.themoviedb.org";
  String _language = "es-CL";
  int _pagePopulars = 0;
  bool _loading = false;
  List<Movie> _populars = new List();

  final _popularsStreamController =
      new StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;
  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  void disposeStreams() {
    // # Si tiene información, cierre, si no, no.
    _popularsStreamController?.close();
  }


  Future<List<Movie>> getNowPlayingInCinema() async {
    String endpoint = "3/movie/now_playing";

    final url =
        Uri.https(_url, endpoint, {"api_key": _apikey, "language": _language});

    return callMoviesGetRest(url);
  }

  Future<List<Movie>> getPopulars() async {
    if (_loading) {
      return [];
    } else {
      _pagePopulars++;
      _loading = true;
    }
    String endpoint = "3/movie/popular";

    final url = Uri.https(_url, endpoint, {
      "api_key": _apikey,
      "language": _language,
      "page": _pagePopulars.toString()
    });

    final response = await callMoviesGetRest(url);

    _populars.addAll(response);
    popularsSink(_populars);
    _loading = false;
    return response;
  }

  Future<List<Movie>> callMoviesGetRest(Uri url) async {
    final response = await http.get(url);

    // dynamic movies = new Movies();

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);

      final movies = new Movies.fromJsonList(decodedData["results"]);

      return movies.movieItems;

      //print (movies.movieItems[0].overview);
    } else {
      return [];
    }
  }

  Future<List<Actor>> getCast(int movieId) async {
    String idToString = movieId.toString();
    String endpoint = "3/movie/$idToString/credits";

    final url =
        Uri.https(_url, endpoint, {"api_key": _apikey, "language": _language});

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    Cast cast = Cast.fromJsonList(decodedData["cast"]);

    return cast.actors;
  }

  Future<List<Movie>> searchMovie(String query) async {

    String endpoint = "3/search/movie";

    final url = Uri.https(_url, endpoint,
        {"api_key": _apikey, "language": _language, "query": query});

    return callMoviesGetRest(url);
  }
}

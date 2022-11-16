import 'dart:convert';

import 'package:api_rest_movies/models/popular_movies_model.dart';
import 'package:http/http.dart' as http;

class Servicesreqest {
  PopularMovies popularMovies = PopularMovies();
  void getReqestServiceApi() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=bcece7279891f96e86df130757123b7b&language=en-US&page=1");
    print(url);
    await http.get(url).then((response) {
      //print(response);
      //print(response.body);
      final recres = jsonDecode(response.body);
      popularMovies = PopularMovies.fromJson(recres);

      print(popularMovies);
    });
    print(popularMovies.results!.first.originalTitle);
  }
}

import 'dart:convert';
import 'package:searchflix/constants.dart';
import 'package:http/http.dart' as http;
import 'package:searchflix/moviemodel.dart';

String api = Constants.movieAPI;

class Moviedata {
  List<Moviemodel> list0 = [];

  Future<void> getlatestMovie() async {
    String url = "https://api.themoviedb.org/3/movie/latest?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    Moviemodel moviemodel = Moviemodel(
        title: jsonData["original_title"].toString(),
        poster_path: "https://image.tmdb.org/t/p/w500" +
            jsonData["poster_path"].toString(),
        vote_average: jsonData["vote_average"].toString(),
        id: jsonData["id"]);
    list0.add(moviemodel);
  }

  List<Moviemodel> list = [];

  Future<void> getupcomingMovie() async {
    String url = "https://api.themoviedb.org/3/movie/upcoming?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      Moviemodel moviemodel = Moviemodel(
          title: element["title"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list.add(moviemodel);
    });
  }

  List<Moviemodel> list2 = [];

  Future<void> getpopularMovie() async {
    String url = "https://api.themoviedb.org/3/movie/popular?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      Moviemodel moviemodel = Moviemodel(
          title: element["title"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list2.add(moviemodel);
    });
  }

  List<Moviemodel> list3 = [];

  Future<void> gettopratedMovie() async {
    String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      Moviemodel moviemodel = Moviemodel(
          title: element["title"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list3.add(moviemodel);
    });
  }

  List<Moviemodel> list4 = [];

  Future<void> getTrendingmovies() async {
    String url = "https://api.themoviedb.org/3/trending/movie/day?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      Moviemodel moviemodel = Moviemodel(
          title: element["title"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list4.add(moviemodel);
    });
  }

  List<Moviemodel> list5 = [];

  Future<void> getDetails(int id) async {
    String url =
        "https://api.themoviedb.org/3/movie/" + id.toString() + "?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    Moviemodel moviemodel = Moviemodel(
      title: jsonData["title"],
      poster_path: "https://image.tmdb.org/t/p/w500" +
          jsonData["poster_path"].toString(),
      vote_average: jsonData["vote_average"].toString(),
      id: jsonData["id"],
      backdrop_path:
          "https://image.tmdb.org/t/p/w500" + jsonData["backdrop_path"],
      overview: jsonData["overview"],
      runtime: jsonData["runtime"],
      release_date: jsonData["release_date"],
      original_language: jsonData["original_language"],
    );
    list5.add(moviemodel);
  }
}

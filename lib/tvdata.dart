import 'dart:convert';
import 'package:searchflix/constants.dart';
import 'package:http/http.dart' as http;
import 'package:searchflix/tvmodel.dart';

String api = Constants.movieAPI;

class TVdata {
  List<TVmodel> list0 = [];

  Future<void> getlatestTV() async {
    String url = "https://api.themoviedb.org/3/tv/latest?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    TVmodel tVmodel = TVmodel(
        name: jsonData["name"],
        poster_path: "https://image.tmdb.org/t/p/w500" +
            jsonData["poster_path"].toString(),
        vote_average: jsonData["vote_average"].toString(),
        id: jsonData["id"],
        first_air_date: jsonData["first_air_date"]);
    list0.add(tVmodel);
  }

  List<TVmodel> list = [];

  Future<void> getairTV() async {
    String url = "https://api.themoviedb.org/3/tv/airing_today?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      TVmodel tVmodel = TVmodel(
          name: element["name"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"],
          first_air_date: element["first_air_date"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list.add(tVmodel);
    });
  }

  List<TVmodel> list2 = [];

  Future<void> getpopularTV() async {
    String url = "https://api.themoviedb.org/3/tv/popular?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      TVmodel tVmodel = TVmodel(
          name: element["name"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"],
          first_air_date: element["first_air_date"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list2.add(tVmodel);
    });
  }

  List<TVmodel> list3 = [];

  Future<void> gettopratedTV() async {
    String url = "https://api.themoviedb.org/3/tv/top_rated?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      TVmodel tVmodel = TVmodel(
          name: element["name"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"],
          first_air_date: element["first_air_date"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list3.add(tVmodel);
    });
  }

  List<TVmodel> list4 = [];

  Future<void> getTrendingTV() async {
    String url = "https://api.themoviedb.org/3/trending/tv/day?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      TVmodel tVmodel = TVmodel(
          name: element["name"],
          poster_path: "https://image.tmdb.org/t/p/w500" +
              element["poster_path"].toString(),
          vote_average: element["vote_average"].toString(),
          id: element["id"],
          first_air_date: element["first_air_date"]);
      if (element["poster_path"] != "https://image.tmdb.org/t/p/w500")
        list4.add(tVmodel);
    });
  }

  List<TVmodel> list5 = [];

  Future<void> getDetails(int id) async {
    String url =
        "https://api.themoviedb.org/3/tv/" + id.toString() + "?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    TVmodel tVmodel = TVmodel(
        name: jsonData["name"],
        poster_path: "https://image.tmdb.org/t/p/w500" +
            jsonData["poster_path"].toString(),
        vote_average: jsonData["vote_average"].toString(),
        id: jsonData["id"],
        backdrop_path: "https://image.tmdb.org/t/p/w500" +
            jsonData["backdrop_path"].toString(),
        overview: jsonData["overview"],
        original_language: jsonData["original_language"],
        number_of_seasons: jsonData["number_of_seasons"],
        number_of_episodes: jsonData["number_of_episodes"],
        first_air_date: jsonData["first_air_date"]);
    list5.add(tVmodel);
  }
}

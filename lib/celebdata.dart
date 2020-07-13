import 'dart:convert';

import 'package:searchflix/celebmodel.dart';
import 'package:searchflix/constants.dart';
import 'package:http/http.dart' as http;

String api = Constants.movieAPI;

class Celebdata {
  List<Celebmodel> list = [];
  List<Celebmodel> list2 = [];

  Future<void> getCData() async {
    String url = "https://api.themoviedb.org/3/person/popular?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      Celebmodel celebmodel = Celebmodel(
          name: element["name"],
          profilepath: "https://image.tmdb.org/t/p/w500" +
              element["profile_path"].toString(),
          id: element["id"],
          known_for_department: element["known_for_department"]);
      if(celebmodel.profilepath!="https://image.tmdb.org/t/p/w500null")
        list.add(celebmodel);
    });
  }

  Future<void> getTrendingCeleb() async {
    String url =
        "https://api.themoviedb.org/3/trending/person/day?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      Celebmodel celebmodel = Celebmodel(
          name: element["name"],
          profilepath: "https://image.tmdb.org/t/p/w500" +
              element["profile_path"].toString(),
          id: element["id"],
          known_for_department: element["known_for_department"]);
      if(celebmodel.profilepath!="https://image.tmdb.org/t/p/w500null")
        list2.add(celebmodel);
    });
  }

  List<Celebmodel> list3 = [];

  Future<void> getDetails(int id) async {
    String url =
        "https://api.themoviedb.org/3/person/" + id.toString() + "?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    Celebmodel celebmodel = Celebmodel(
        name: jsonData["name"],
        profilepath: "https://image.tmdb.org/t/p/w500" +
            jsonData["profile_path"].toString(),
        id: jsonData["id"],
        birthday: jsonData["birthday"],
        known_for_department: jsonData["known_for_department"],
        place_of_birth: jsonData["place_of_birth"]);
    if(celebmodel.profilepath!="https://image.tmdb.org/t/p/w500null")
    list3.add(celebmodel);
  }

}

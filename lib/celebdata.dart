import 'dart:convert';

import 'package:searchflix/celebmodel.dart';
import 'package:searchflix/constants.dart';
import 'package:http/http.dart' as http;

String api=Constants.movieAPI;

class Celebdata{
  List<Celebmodel> list=[];
  List<Celebmodel> list2=[];

  Future<void> getCData() async{
    String url="https://api.themoviedb.org/3/person/popular?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element){
      Celebmodel celebmodel=Celebmodel(
          name: element["name"],
          profilepath:"https://image.tmdb.org/t/p/w500"+element["profile_path"].toString()
      );
      if(element["profile_path"]!=null)
      list.add(celebmodel);
    });
  }

  Future<void> getTrendingCeleb() async{
    String url="https://api.themoviedb.org/3/trending/person/day?api_key=$api";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element){
      Celebmodel celebmodel=Celebmodel(
          name: element["name"],
          profilepath:"https://image.tmdb.org/t/p/w500"+element["profile_path"].toString()
      );
      if(element["profile_path"]!=null)
        list2.add(celebmodel);
    });
  }
}
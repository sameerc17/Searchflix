class Moviemodel{
  String title;
  String poster_path;
  String vote_average;
  int id;
  String backdrop_path;
  String overview;
  int runtime;
  String release_date;
  String original_language;
  List<String> genre_ids=new List<String>();

  Moviemodel({this.title,this.poster_path,this.vote_average,this.id,this.backdrop_path,this.overview,this.runtime,this.release_date,this.original_language,this.genre_ids});
}
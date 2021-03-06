import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchflix/celebdata.dart';
import 'package:searchflix/celebdetails.dart';
import 'package:searchflix/celebmodel.dart';
import 'package:searchflix/moviedata.dart';
import 'package:searchflix/moviedetails.dart';
import 'package:searchflix/moviemodel.dart';
import 'package:searchflix/tvdata.dart';
import 'package:searchflix/tvmodel.dart';

import 'tvdetails.dart';

class Homeview extends StatefulWidget {
  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  List<Moviemodel> list = new List<Moviemodel>();
  List<TVmodel> list2 = new List<TVmodel>();
  List<Celebmodel> list3 = new List<Celebmodel>();
  bool loading = true,loading2=true,loading3=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrendingMovies();
    getTrendingTV();
    getTrendingCeleb();
  }

  getTrendingMovies() async {
    Moviedata moviedata = Moviedata();
    await moviedata.getTrendingmovies();
    list = moviedata.list4;
    setState(() {
      loading = false;
    });
  }

  getTrendingTV() async {
    TVdata tVdata = TVdata();
    await tVdata.getTrendingTV();
    list2 = tVdata.list4;
    setState(() {
      loading2 = false;
    });
  }

  getTrendingCeleb() async {
    Celebdata celebdata = Celebdata();
    await celebdata.getTrendingCeleb();
    list3 =celebdata.list2 ;
    setState(() {
      loading3 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading || loading2 || loading3
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black87,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1582219206256-21f4895531ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1476&q=80",
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
//                      Color(0xfff12711),
                          Color(0xdff5a519),
                          Colors.amber.shade400
//                      Color(0xfffdc830)
                        ]),
                      ),
                      height: 92,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Tired of searching online\n for what to binge-watch?\n Welcome to SearchFlix\n',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.amaranth(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.check_box,
                                color: Colors.orange.shade900,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TRENDING MOVIES',
                    style: GoogleFonts.josefinSlab(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 160,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: movietile(
                              title: list[index].title,
                              poster_path: list[index].poster_path,
                              vote_average: list[index].vote_average,
                              id: list[index].id,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'TRENDING TV SERIES',
                    style: GoogleFonts.josefinSlab(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 160,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                        itemCount: list2.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: tvtile(
                              name: list2[index].name,
                              poster_path: list2[index].poster_path,
                              vote_average: list2[index].vote_average,
                              id: list2[index].id,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Text(
                    'TRENDING CELEBS',
                    style: GoogleFonts.josefinSlab(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 165,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                        itemCount: list3.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: celebtile(
                              name: list3[index].name,
                              profilepath: list3[index].profilepath,
                              id: list3[index].id,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
  }
}

class movietile extends StatelessWidget {
  final String title, poster_path, vote_average;
  final int id;

  movietile({this.title, this.poster_path, this.vote_average, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(
              id: id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: 90,
          color: Colors.black38,
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image.network(
                  poster_path,
                  height: 100,
                  width: 90,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  check(title),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      add(vote_average),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String check(String name) {
//    name = name.replaceAll(" ", "\n");
    return name;
  }

  String add(String vote_average) {
    return "  " + vote_average + "/10";
  }
}

class tvtile extends StatelessWidget {
  final String name, poster_path, vote_average;
  final int id;

  tvtile({this.name, this.poster_path, this.vote_average,this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(id.toString()+" "+name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TVDetails(
              id: id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: 90,
          color: Colors.black38,
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image.network(
                  poster_path,
                  height: 100,
                  width: 90,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  check(name),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      add(vote_average),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String check(String name) {
//    name = name.replaceAll(" ", "\n");
    return name;
  }

  String add(String vote_average) {
    return "  "+vote_average+"/10";
  }
}

class celebtile extends StatelessWidget {
  final String name, profilepath;
  final int id;

  celebtile({this.name, this.profilepath, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Celebdetails(id: id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          color: Colors.black38,
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image.network(
                  profilepath,
                  height: 115,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  check(name),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String check(String name) {
    name = name.replaceAll(" ", "\n");
    return name;
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchflix/tvdata.dart';
import 'package:searchflix/tvdetails.dart';
import 'package:searchflix/tvmodel.dart';

class TVview extends StatefulWidget {
  @override
  _TVviewState createState() => _TVviewState();
}

class _TVviewState extends State<TVview> {
  bool loading1=true,loading2 = true, loading3 = true, loading4 = true;
  List<TVmodel> list0 = new List<TVmodel>();
  List<TVmodel> list = new List<TVmodel>();
  List<TVmodel> list2 = new List<TVmodel>();
  List<TVmodel> list3 = new List<TVmodel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getairTV();
    getlatestTV();
    getpopularTV();
    gettopratedTV();
  }

  @override
  Widget build(BuildContext context) {
    return loading1 || loading2 || loading3 || loading4
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
                  image: NetworkImage("https://images.unsplash.com/photo-1582219206256-21f4895531ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1476&q=80",),fit: BoxFit.fill
                )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
                          ),
                          fit: BoxFit.fill
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Latest Release:\n   $oname',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'AIRING TODAY',
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
                            child: tvtile(
                              name: list[index].name,
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
                    'POPULAR',
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
                    height: 20,
                  ),
                  Text(
                    'TOP RATED',
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
                        itemCount: list3.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: tvtile(
                              name: list3[index].name,
                              poster_path: list3[index].poster_path,
                              vote_average: list3[index].vote_average,
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

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }

  String oname = "";

  getairTV() async {
    TVdata tVdata = TVdata();
    await tVdata.getairTV();
    list= tVdata.list;
    print(list.length);
    setState(() {
      loading1 = false;
    });
  }

  getlatestTV() async {
    TVdata tVdata = TVdata();
    await tVdata.getlatestTV();
    list0 = tVdata.list0;
    print(list0.length);
    setState(() {
      loading4 = false;
      oname = list0[0].name;
    });
  }

  getpopularTV() async {
    TVdata tVdata = TVdata();
    await tVdata.getpopularTV();
    list2 = tVdata.list2;
    setState(() {
      loading2 = false;
    });
  }

  gettopratedTV() async {
    TVdata tVdata = TVdata();
    await tVdata.gettopratedTV();
    list3 = tVdata.list3;
    setState(() {
      loading3 = false;
    });
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

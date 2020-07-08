import 'package:flutter/material.dart';
import 'package:searchflix/tvdata.dart';
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
                  Container(
                    alignment: Alignment.center,
                    width: 145.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  Text(
                    'AIRING TODAY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 145.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 165,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: tvtile(
                              title: list[index].name,
                              poster_path: list[index].poster_path,
                              vote_average: list[index].vote_average,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width:210.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  Text(
                    'POPULAR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 210.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 165,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                        itemCount: list2.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: tvtile(
                              title: list2[index].name,
                              poster_path: list2[index].poster_path,
                              vote_average: list2[index].vote_average,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 220.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  Text(
                    'TOP RATED',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 220.0,
                    height: 2.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
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
                            child: tvtile(
                              title: list3[index].name,
                              poster_path: list3[index].poster_path,
                              vote_average: list3[index].vote_average,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
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
  final String title, poster_path, vote_average;

  tvtile({this.title, this.poster_path, this.vote_average});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        color: Colors.black87,
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
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    check(vote_average),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String check(String name) {
    name = name.replaceAll(" ", "\n");
    return name;
  }
}

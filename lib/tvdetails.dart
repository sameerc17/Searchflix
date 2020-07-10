import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:searchflix/tvdata.dart';
import 'package:searchflix/tvmodel.dart';

class TVDetails extends StatefulWidget {
  final int id;

  TVDetails({this.id});

  @override
  TVDetailsState createState() => TVDetailsState();
}

class TVDetailsState extends State<TVDetails> {
  List<TVmodel> list = new List<TVmodel>();
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            child: Center(
              child: Text("Hello " + getme()),
            ),
          )
        : Material(
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1582219206256-21f4895531ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1476&q=80",
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: ClipRect(
                        child: Image.network(
                          list[0].backdrop_path,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  list[0].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Wrap(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow.shade900,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            list[0].vote_average,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        list[0].original_language,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        list[0].first_air_date.substring(0,4),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                list[0].overview,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  String getme() {
    return widget.id.toString();
  }

  getDetails(int id) async {
    TVdata tVdata = TVdata();
    await tVdata.getDetails(id);
    list = tVdata.list5;
    setState(() {
      loading = false;
    });
  }
}

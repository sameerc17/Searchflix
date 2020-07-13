import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchflix/celebdata.dart';
import 'package:searchflix/celebdetails.dart';
import 'package:searchflix/celebmodel.dart';

class Celebview extends StatefulWidget {
  @override
  _CelebviewState createState() => _CelebviewState();
}

class _CelebviewState extends State<Celebview> {
  bool loading = true;
  List<Celebmodel> list = new List<Celebmodel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCeleb();
  }

  @override
  Widget build(BuildContext context) {
    return loading
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'MOST POPULAR CELEBS',
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
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: celebtile(
                              name: list[index].name,
                              profilepath: list[index].profilepath,
                              id: list[index].id,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
  }

  getCeleb() async {
    Celebdata celebdata = Celebdata();
    await celebdata.getCData();
    list = celebdata.list;
    setState(() {
      loading = false;
    });
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

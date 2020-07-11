import 'package:flutter/material.dart';
import 'package:searchflix/celebdata.dart';
import 'package:searchflix/celebmodel.dart';

class Celebdetails extends StatefulWidget {

  final int id;
  Celebdetails({this.id});

  @override
  _CelebdetailsState createState() => _CelebdetailsState();
}

class _CelebdetailsState extends State<Celebdetails> {

  List<Celebmodel> list = new List<Celebmodel>();
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
                flex: 6,
                child: ClipRect(
                  child: Image.network(
                    list[0].profilepath,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: <Widget>[
                                    Icon(
                                      Icons.cake,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      list[0].birthday,
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
                                  list[0].known_for_department,
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
                                  solve(list[0].place_of_birth),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
    Celebdata celebdata = Celebdata();
    await celebdata.getDetails(id);
    list = celebdata.list3;
    setState(() {
      loading = false;
    });
  }

  String solve(String place_of_birth) {
    int ind=place_of_birth.indexOf(",");
    return place_of_birth.substring(0,ind);
  }

}

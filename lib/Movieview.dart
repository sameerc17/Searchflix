import 'package:flutter/material.dart';
import 'package:searchflix/moviedata.dart';
import 'package:searchflix/moviemodel.dart';

class Movieview extends StatefulWidget {
  @override
  _MovieviewState createState() => _MovieviewState();
}

class _MovieviewState extends State<Movieview> {
  bool loading1= true,loading2=true,loading3=true,loading4=true;
  List<Moviemodel> list0 = new List<Moviemodel>();
  List<Moviemodel> list = new List<Moviemodel>();
  List<Moviemodel> list2 = new List<Moviemodel>();
  List<Moviemodel> list3 = new List<Moviemodel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlatestMovie();
    getupcomingMovie();
    getpopularMovie();
    gettopratedMovie();
  }

  @override
  Widget build(BuildContext context) {
    return loading1 || loading2 || loading3 || loading4 ?
    Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black87,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ):SingleChildScrollView(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: list0.isEmpty
                    ?Image.network("https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",height: 250,fit: BoxFit.fill,)
                    :Image.network(list0[0].poster_path,height: 250,fit: BoxFit.fill,),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.center,
              width: 195.0,
              height: 2.0,
              color: Colors.white,
            ),
            Text(
              'UPCOMING MOVIES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 195.0,
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
                      child: movietile(
                        title: list[index].title,
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
              width: 185.0,
              height: 2.0,
              color: Colors.white,
            ),
            Text(
              'POPULAR MOVIES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 185.0,
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
                      child: movietile(
                        title: list2[index].title,
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
              width: 195.0,
              height: 2.0,
              color: Colors.white,
            ),
            Text(
              'TOP RATED MOVIES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 195.0,
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
                      child: movietile(
                        title: list3[index].title,
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

  getlatestMovie() async {
    Moviedata moviedata = Moviedata();
    await moviedata.getlatestMovie();
    list0 = moviedata.list0;
    setState(() {
      loading4 = false;
    });
  }

  getupcomingMovie() async {
    Moviedata moviedata = Moviedata();
    await moviedata.getupcomingMovie();
    list = moviedata.list;
    setState(() {
      loading1 = false;
    });
  }

  getpopularMovie() async {
    Moviedata moviedata = Moviedata();
    await moviedata.getpopularMovie();
    list2 = moviedata.list2;
    setState(() {
      loading2 = false;
    });
  }

  gettopratedMovie() async {
    Moviedata moviedata = Moviedata();
    await moviedata.gettopratedMovie();
    list3 = moviedata.list3;
    setState(() {
      loading3 = false;
    });
  }

}

class movietile extends StatelessWidget {
  final String title,poster_path,vote_average;

  movietile({this.title,this.poster_path,this.vote_average});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(poster_path,height: 100,width: 90,fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(check(title),textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.star,color: Colors.yellow,),
                  SizedBox(width: 5,),
                  Text(check(vote_average),textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String check(String name) {
    name=name.replaceAll(" ","\n");
    return name;
  }
}

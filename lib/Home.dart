import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchflix/Celebview.dart';
import 'package:searchflix/HomeView.dart';
import 'package:searchflix/Movieview.dart';
import 'package:searchflix/TVview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          bottom: TabBar(
            indicatorColor: Colors.pinkAccent,
            labelColor: Colors.yellow.shade600,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'HOME',
              ),
              Tab(
                icon: Icon(Icons.movie),
                text: 'MOVIES',
              ),
              Tab(
                icon: Icon(Icons.tv),
                text: 'TV SHOWS',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'CELEBS',
              ),
            ],
          ),
          title: Text(
            'SearchFlix',
            style: GoogleFonts.shojumaru(
                fontSize: 35,
                color: Colors.yellow.shade800,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Homeview(),
            Movieview(),
            TVview(),
            Celebview(),
          ],
        ),
      ),
    );
  }
}

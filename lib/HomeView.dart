import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Homeview extends StatefulWidget {
  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1582219206256-21f4895531ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1476&q=80",
                ),
                fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Tired of searching online\n for what to binge-watch?\n Welcome to SearchFlix\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}

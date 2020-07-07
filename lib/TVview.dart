import 'package:flutter/material.dart';

class TVview extends StatefulWidget {
  @override
  _TVviewState createState() => _TVviewState();
}

class _TVviewState extends State<TVview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black87,
      ),
    );  }
}

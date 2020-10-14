import 'package:flutter/material.dart';

import 'andrewDev/home/search_elections_place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Directionality(
        textDirection: TextDirection.rtl, // set this property
        child: SearchElections(),
      ),
    );
  }
}

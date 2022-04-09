import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const TreePlenishApp());
}

class TreePlenishApp extends StatelessWidget {
  const TreePlenishApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.green,
          title: const Text("Tree Plenish App"),
        ),

        body: ListView(
          addAutomaticKeepAlives: false, // garbage collect items off screen
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 300,
              color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
              child: const Text("Hello"),
            ),
            Container(
              height: 300,
              color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
              child: const Text("Hello"),
            ),
            Container(
              height: 300,
              color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
              child: const Text("Hello"),
            ),
          ]
        )

        // body: ListView.builder(
        //   itemBuilder: (_, index) {
        //     return Container(
        //       height: 300,
        //       color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
        //       child: const Text("Hello"),
        //     );
        //   },
        // )

        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

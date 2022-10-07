import 'dart:async';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter = 0;
  StreamController<int> counterController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StreamBuilder(
            stream: counterController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 70),
                );
              } else {
                return Text(
                  "0",
                  style: TextStyle(fontSize: 70),
                );
              }
            }),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          counterController.sink.add(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

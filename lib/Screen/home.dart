// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:api_testing/Screen/fiveApiPage.dart';
import 'package:api_testing/Screen/fourApiPage.dart';
import 'package:api_testing/Screen/thirdApiPage.dart';
import 'package:flutter/material.dart';

import 'firstApiPage.dart';
import 'secondApiPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Home"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstApiPage()));
                  },
                  child: Text("First Api")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondApiPage()));
                  },
                  child: Text("Second Api")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdApiPage()));
                  },
                  child: Text("Third Api")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FourApiPage()));
                  },
                  child: Text("Four Api")),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FiveApiPage()));
                  },
                  child: Text("Five Api")),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

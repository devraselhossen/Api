// ignore_for_file: prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';

import '../Model/firstModel.dart';

class Details extends StatefulWidget {

  final Products products;

  Details({required this.products});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: ListView(
            children: [
              Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("data")
                      ],
                    ),
                    Column(
                      children: [
                        
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
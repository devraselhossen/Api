// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Api_Manager/apiManager2.dart';
import '../Model/secondModel.dart';

class SecondApiPage extends StatefulWidget {
  const SecondApiPage({Key? key}) : super(key: key);

  @override
  State<SecondApiPage> createState() => _SecondApiPageState();
}

class _SecondApiPageState extends State<SecondApiPage> {
  late Future<Welcome> _wellcome;

  @override
  void initState() {
    _wellcome = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Api page"),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 7, right: 7, top: 7),
          child: Container(
            width: double.maxFinite,
            height: 250,
            child: FutureBuilder<Welcome>(
              future: _wellcome,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Image.network(snapshot.data!.image,height: 100,width: 100,),
                              ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Title : " + snapshot.data!.title + ".",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Categories : " +
                                        snapshot.data!.category.toLowerCase() +
                                        ".",
                                    style: GoogleFonts.volkhov(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.w200,
                                    )),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Price : " + snapshot.data!.price.toString() + " TK.",
                                    style: GoogleFonts.lobsterTwo(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.w200,
                                    )),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                          ));
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ));
  }
}


// Center(
//                               child: Container(
//                                 margin: EdgeInsets.only(bottom: 15),
//                                 child: Image.network(snapshot.data!.image,height: 100,width: 100,),
//                               ),
//                             ),
//                             Text("Id : ${snapshot.data!.id.toString()}"),
//                             Text("Category : ${snapshot.data!.category.toString()}"),
//                             Text(
//                                 "Description : ${snapshot.data!.description.toString()}"),
//                             Text("Price : ${snapshot.data!.price.toString()}"),
// ignore_for_file: unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Model/fiveModel.dart';

class FiveApiPage extends StatefulWidget {
  const FiveApiPage({Key? key}) : super(key: key);

  @override
  State<FiveApiPage> createState() => _FiveApiPageState();
}

class _FiveApiPageState extends State<FiveApiPage> {
  List<Welcome> data = [];

  @override
  initState() {
    super.initState();
    _preased();
  }

  Future<void> _preased() async {
    var response = await http
        .get(
      Uri.parse("https://fakestoreapi.com/products?limit=5"),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
          data = welcomeFromJson(value.body);
        } else {
          'vul hoise ${value.statusCode}';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Five Api page"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 7, right: 7, top: 7),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 2.7,
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemBuilder: (context, index) {
                      final use = data[index];
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
                                      child: Image.network(
                                    use.image,
                                    height: 100,
                                    width: 100,
                                  )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Title : " + use.title + ".",
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
                                        use.category.toLowerCase() +
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
                                    "Price : " + use.price.toString() + " TK.",
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
                    }),
            ),
          ],
        ),
      ),
    );
  }
}

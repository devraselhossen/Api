// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable

import 'package:api_testing/Screen/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../Model/firstModel.dart';

class FirstApiPage extends StatefulWidget {
  const FirstApiPage({Key? key}) : super(key: key);

  @override
  State<FirstApiPage> createState() => _FirstApiPageState();
}

class _FirstApiPageState extends State<FirstApiPage> {
  List<Products> data = [];

  @override
  initState() {
    super.initState();
    onPressed();
  }

  Future<void> onPressed() async {
    var respons = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
          data = productsFromJson(value.body);
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
        title: Text("All Data"),
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
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Details(products: use),
                              )),
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
                                        use.category.name.toLowerCase() +
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
          )),
    );
  }
}

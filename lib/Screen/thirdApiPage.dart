import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/thirdModel.dart';

class ThirdApiPage extends StatefulWidget {
  const ThirdApiPage({ Key? key }) : super(key: key);

  @override
  State<ThirdApiPage> createState() => _ThirdApiPageState();
}

class _ThirdApiPageState extends State<ThirdApiPage> {

  List<String> data = [];

  @override
  initState() {
    super.initState();
    _onPreased();
  }

  Future<void> _onPreased() async {
    var response = await http
        .get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
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
        title: Text("Catagories"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 7, right: 7, top: 7),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final use = data[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(use),
                      )
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
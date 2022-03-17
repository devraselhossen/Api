// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/secondModel.dart';


// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse("https://fakestoreapi.com/products/1"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
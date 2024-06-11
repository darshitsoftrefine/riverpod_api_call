import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class DataController{

  Future<List<Data>> fetchTenantsItems() async {
    String baseUrl = "https://reqres.in/api/users?page=2";
    var response = await http.get(Uri.parse(baseUrl),);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];
      debugPrint("LOG:: fetchTenantsItems Result:: $result");
      Iterable list = result;
      print("Hello ${list.map((tenantsData) => Data.fromJson(tenantsData)).toList()}");
      return list.map((tenantsData) => Data.fromJson(tenantsData)).toList();

    } else {
      throw Exception("Failed to load data");
    }
  }
}

final dataProvider = Provider<DataController>((ref) => DataController());
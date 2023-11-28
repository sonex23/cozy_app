import 'dart:convert';

import 'package:cozy/models/space.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

var url = Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces');

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>> getRecommendedSpaces() async {
    var result = await http.get(url);

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((e) => Space.fromJson(e)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}

import 'dart:convert';

import 'package:crackwatchapp/models/game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GamesProvider extends ChangeNotifier {
  GamesProvider() {
    getData();
  }

  List<Game> _games = [];

  List<Game> get games => _games;

  void getData() async {
    Uri uri = Uri.parse(
        'https://api.crackwatch.com/api/games?is_aaa=true&is_released=true&is_cracked=true');
    http.Response response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${jsonData.toString()}');
    for (var item in jsonData) {
      games.add(Game.fromJson(item));
      notifyListeners();
    }
    print(games.length);
  }
}

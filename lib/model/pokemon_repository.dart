import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> load() {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    return http.get(url).then<List<Pokemon>>((response) {
      if (response.statusCode == 200) {
        Map json = JsonDecoder().convert(response.body);
        return json['data'].map<Pokemon>((item) {
          return Pokemon.fromJson(item);
        }).toList();
      } else {
        return [];
      }
    }).catchError((error) {
      return null;
    });
  }
}

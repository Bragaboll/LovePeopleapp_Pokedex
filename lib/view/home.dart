import 'dart:convert';
import 'package:app_pokedex/Pokemon.dart';
import 'package:app_pokedex/presenter/pokemonwidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemonList = [];

  bool loading = false;

  @override
  void initState() {
    carregarPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'),
          ),
        ],
        title: Text('Pokedex'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return PokemonWidget(
                item: pokemonList[index],
              );
            },
          ),
          if (loading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void carregarPokemon() {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map json = JsonDecoder().convert(response.body);
        setState(() {
          pokemonList = json['data'].map<Pokemon>((item) {
            return Pokemon.fromJson(item);
          }).toList();
        });
      }
      setState(() {
        loading = false;
      });
    });
  }
}

import 'package:app_pokedex/model/pokemon.dart';
import 'package:app_pokedex/model/pokemon_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  final PokemonRepository _repository;

  HomeController(this._repository);

  List<Pokemon> pokemonList = [];
  bool loading = false;

  void loadPokemon() {
    _repository.load().then((value) {
      pokemonList = value;
      notifyListeners();
    });
  }
}

import 'package:app_pokedex/model/pokemon.dart';
import 'package:app_pokedex/presenter/home_controller.dart';
import 'package:app_pokedex/view/pokemonwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    context.read<HomeController>().loadPokemon();
    super.didChangeDependencies();
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
      body: Consumer<HomeController>(
        builder: (_, controller, child) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.pokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonWidget(item: controller.pokemonList[index]);
                },
              ),
              if (controller.loading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}

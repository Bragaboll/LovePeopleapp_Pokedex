import 'package:app_pokedex/view/PokeDetailPage.dart';
import 'package:app_pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon item;
  const PokemonWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void irParaProximaPag() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PokeDetailPage(item: item ?? ''),
        ),
      );
    }

    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(item.name),
        trailing: Text('#${item.number}'),
        leading: Image.network(item.thumbnailImage),
        onTap: () {
          irParaProximaPag();
        },
      ),
    );
  }
}

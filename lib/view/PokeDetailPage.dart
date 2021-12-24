import 'package:app_pokedex/Pokemon.dart';
import 'package:flutter/material.dart';

class PokeDetailPage extends StatelessWidget {
  final Pokemon item;

  const PokeDetailPage({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text('#${item.number}'),
                              ),
                            ),
                            Center(
                              child: Image.network(
                                item.thumbnailImage,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        item.description,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Tipo:',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        item.type
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', '')
                            .replaceAll(',', ''),
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Fraquezas:',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        item.weakness
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', '')
                            .replaceAll(',', '')
                            .replaceAll(',', ''),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

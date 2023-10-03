import 'package:flutter/material.dart';
import 'package:kuis_prakpam/pokemon_data.dart';

class GriView extends StatelessWidget {
  const GriView({super.key, required this.pokemon});
  final PokemonData pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Grid View"),
      backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
          itemCount: listPokemon.length,
          itemBuilder: (context, index) {
            final PokemonData place = listPokemon[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return detail(pokemon: place);
                }));
              },
              child: Card(
                  child: Row(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.network(place.image[0]),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(place.name)
                  ])),
            );
          }),
    );
  }
}

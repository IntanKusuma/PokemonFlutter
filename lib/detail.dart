import 'package:flutter/material.dart';
import 'package:kuis_prakpam/pokemon_data.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required this.pokemon});
  final PokemonData pokemon;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String favorit = "";

  bool isFavorite = false;
  
  late TextEditingController favoriteController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoriteController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    favoriteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        backgroundColor: Colors.lightBlue,
          actions: [
            IconButton(
            onPressed: () {
              String text = "";
              favorit = favoriteController.text.trim();

              var snackBar = SnackBar(
              content: Text(text),
              backgroundColor: (isFavorite) ? Colors.green : Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: (isFavorite) ? Icon(Icons.favorite, color: Colors.deepOrange,) : Icon(Icons.favorite_border_outlined, color: Colors.deepOrange,),
            // const Icon(Icons.remove_red_eye, color: Colors.deepOrange,),
          ),]

        ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.pokemon.image.length,
                itemBuilder: (context, index) {
                  return Image.network(widget.pokemon.image[0]);
                }),
          ),
          Column(
            children: [
              Text(
                widget.pokemon.name,
                style: TextStyle(fontSize: 30),
              ),
              Text(widget.pokemon.type[0]),
              Text(widget.pokemon.weakness[0]),
              Text(widget.pokemon.prevEvolution[0]),
              Text(widget.pokemon.nextEvolution[0]),
            ],
          )
        ],
      ),
    );
  }
}

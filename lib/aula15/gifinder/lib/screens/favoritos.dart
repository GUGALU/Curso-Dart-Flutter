import 'package:flutter/material.dart';
import 'package:gifinder/entity/gif.dart';
import 'package:gifinder/screens/ver_gif.dart';
import 'package:gifinder/services/banco.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Banco.buscar(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var gifs = snapshot.data as List<Gif>;

              return GridView.builder(
                itemCount: gifs.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => VerGif(gifs[index]),
                              ),
                            )
                            .then((value) => setState(() {}));
                      },
                      child: Image.network(
                        gifs[index].previewUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 3,
              );
            }
          },
        ),
      ),
    );
  }
}

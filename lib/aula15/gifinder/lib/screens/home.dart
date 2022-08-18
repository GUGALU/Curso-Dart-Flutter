import 'package:flutter/material.dart';
import 'package:gifinder/entity/gif.dart';
import 'package:gifinder/screens/ver_gif.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String busca = "";
  int pagina = 0;

  void proximaPagina() {
    setState(() {
      pagina++;
    });
  }

  void resetarPagina() {
    setState(() {
      pagina = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => busca = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Pesquisar GIFs"),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {}),
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            FutureBuilder(
              future: Gif.getGifs(busca: busca, pagina: pagina),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var gifs = snapshot.data as List<Gif>;

                  return Expanded(
                    child: GridView.builder(
                      itemCount: gifs.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 1,
                      ),
                      itemBuilder: (context, index) {
                        if (index == gifs.length) {
                          return ElevatedButton(
                            onPressed: proximaPagina,
                            child: Text("Carregar Mais"),
                          );
                        }

                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VerGif(gifs[index]),
                                ),
                              );
                            },
                            child: Image.network(
                              gifs[index].previewUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 3,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

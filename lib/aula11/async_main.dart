import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<String> simularRequisicao() {
  return Future.delayed(Duration(seconds: 2), () => "abc");
}

Future<Response<dynamic>> makeRequest(String url) async {
  var req = await Dio().get(url);

  return req;
}

void mostrarResultado() async {
  var req = await makeRequest("https://viacep.com.br/ws/01001000/json/");

  var dados = req.data as Map<String, dynamic>;

  print(dados["localidade"]);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeCachorro(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  String cep = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              onChanged: (value) => cep = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("CEP"),
              ),
            ),
            ElevatedButton(
              child: Text("mostrar informação"),
              onPressed: () async {
                var r =
                    await makeRequest("https://viacep.com.br/ws/${cep}/json/");

                var dados = r.data as Map<String, dynamic>;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Informações"),
                    content: Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Bairro: ${dados["bairro"]}"),
                          Text("Localidade: ${dados["localidade"]}"),
                          Text("UF: ${dados["uf"]}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class HomeUniversidades extends StatelessWidget {
  const HomeUniversidades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: makeRequest(
              "http://universities.hipolabs.com/search?country=Brazil"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var req = snapshot.data as Response<dynamic>;
              var dados = req.data as List<dynamic>;
              return ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(dados[index]["name"]),
                    subtitle: Text(dados[index]["web_pages"][0]),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class HomeCachorro extends StatefulWidget {
  const HomeCachorro({Key? key}) : super(key: key);

  @override
  State<HomeCachorro> createState() => _HomeCachorroState();
}

class _HomeCachorroState extends State<HomeCachorro> {
  Widget cachorro = Container();

  void getCachorro() async {
    var req = await makeRequest("https://dog.ceo/api/breeds/image/random");

    setState(() {
      cachorro = Image.network(
        req.data["message"],
        width: 400,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            cachorro,
            ElevatedButton(
              child: Text("Mostrar outro"),
              onPressed: getCachorro,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:gifinder/services/network.dart';

const String apiUrl = "https://g.tenor.com/v1";
const String apiKey = "LIVDSRZULELA";

class Gif {
  String url;
  String previewUrl;

  Gif({required this.url, required this.previewUrl});

  static Gif fromJson(Map<String, dynamic> json) {
    return Gif(
        url: json["media"][0]["gif"]["url"],
        previewUrl: json["media"][0]["nanogif"]["url"]);
  }

  static Future<List<Gif>> getGifs({String busca = ""}) async {
    var gifs = <Gif>[];

    var url = "$apiUrl/search?q=$busca&key=$apiKey&limit=12";

    var json = await Network(url).makeRequest();

    if (json?["results"] != null) {
      var dados = json?["results"] as List<dynamic>;

      for (var valor in dados) {
        gifs.add(fromJson(valor));
      }
    }

    return gifs;
  }
}

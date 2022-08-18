import 'package:dio/dio.dart';

class Network {
  String url;

  Network(this.url);

  Future<Map<dynamic, dynamic>?> makeRequest() async {
    var requisicao = await Dio().get(url);

    if (requisicao.statusCode == 200) {
      return requisicao.data;
    } else {
      print(requisicao.statusCode);
    }
  }
}

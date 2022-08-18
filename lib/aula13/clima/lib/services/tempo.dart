import 'package:clima/services/api.dart';
import 'package:clima/services/localizacao.dart';
import 'package:clima/services/network.dart';

class Tempo {
  static Future<dynamic> getTempo() async {
    var localizacao = Localizacao();

    await localizacao.getLocalizacao();

    var requisicao = await Network(
            "${API.apiUrl}?appid=${API.key}&lat=${localizacao.latitude}&lon=${localizacao.longitude}&units=metric")
        .makeRequest();

    return API.fromJson(requisicao);
  }

  static getEmoji(int condicao) {
    if (condicao < 300) {
      return '🌩';
    } else if (condicao < 400) {
      return '🌧';
    } else if (condicao < 600) {
      return '☔️';
    } else if (condicao < 700) {
      return '☃️';
    } else if (condicao < 800) {
      return '🌫';
    } else if (condicao == 800) {
      return '☀️';
    } else if (condicao <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static getDescricao(int temp) {
    if (temp > 28) {
      return 'É hora do 🍦';
    } else if (temp > 22) {
      return 'Hora de shorts e 👕';
    } else if (temp < 15) {
      return 'Você vai precisar de um 🧣 e 🧤';
    } else {
      return 'Leve uma 🧥 para garantir';
    }
  }
}

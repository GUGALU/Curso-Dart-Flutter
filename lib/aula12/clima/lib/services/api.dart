class API {
  static const String key = "";
  static const String apiUrl =
      "https://api.openweathermap.org/data/2.5/weather";

  int temperatura;
  int condicao;
  String cidade;

  API(this.temperatura, this.condicao, this.cidade);

  static API? fromJson(Map<dynamic, dynamic>? json) {
    if (json != null) {
      return API(
        json["main"]["temp"].toInt(),
        json["weather"][0]["id"],
        json["name"],
      );
    }
  }
}

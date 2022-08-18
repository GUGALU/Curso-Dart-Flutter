import 'package:geolocator/geolocator.dart';

class Localizacao {
  double? latitude;
  double? longitude;

  Future<void> getLocalizacao() async {
    try {
      var permissao = await Geolocator.checkPermission();
      if (permissao == LocationPermission.denied ||
          permissao == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }

      var posicao = await Geolocator.getCurrentPosition();
      latitude = posicao.latitude;
      longitude = posicao.longitude;
    } catch (err) {
      print(err);
    }
  }
}

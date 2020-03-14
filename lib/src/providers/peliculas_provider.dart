import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = 'ef326cfd030696ba397b24be8ba3fe05';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final respuesta = await http.get(url);
    final decodeData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'languaje': _languaje});
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    final url = Uri.https(
        _url, '3/movie/popular', {'api_key': _apiKey, 'languaje': _languaje});
    return await _procesarRespuesta(url);
  }
}

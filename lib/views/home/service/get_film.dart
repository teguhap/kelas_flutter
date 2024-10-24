import 'dart:convert';

import 'package:http/http.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/views/home/service/model/nowplaying_response_model.dart';
import 'package:mulai_flutter_2/views/home/service/model/populafilm_response_model.dart';

class GetFilm {
  Future<List<FilmModel>> getNowPlayingFilm() async {
    String url =
        '${Config.baseUrl}/3/movie/now_playing?api_key=${Config.apiKey}';

    try {
      Response response = await get(Uri.parse(url));

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        NowPlayingFilmResponseModel nowPlayingFilmResponseModel =
            NowPlayingFilmResponseModel.fromJson(jsonDecode(response.body));

        return nowPlayingFilmResponseModel.results ?? [];
      } else {
        return [];
      }
    } on Exception catch (e) {
      return [];
    }
  }

  Future<List<FilmModel>> getNowPopularFilm() async {
    String url = '${Config.baseUrl}/3/movie/popular?api_key=${Config.apiKey}';

    try {
      Response response = await get(Uri.parse(url));

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        PopularFilmResponseModel popularFilmResponseModel =
            PopularFilmResponseModel.fromJson(jsonDecode(response.body));

        return popularFilmResponseModel.results ?? [];
      } else {
        return [];
      }
    } on Exception catch (e) {
      return [];
    }
  }
}

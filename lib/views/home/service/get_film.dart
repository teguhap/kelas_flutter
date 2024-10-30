import 'dart:convert';

import 'package:get/get.dart';
// import 'package:http/http.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/views/home/service/model/genre_list.dart';
import 'package:mulai_flutter_2/views/home/service/model/nowplaying_response_model.dart';
import 'package:mulai_flutter_2/views/home/service/model/populafilm_response_model.dart';

class GetFilm extends GetConnect {
  Future<List<FilmModel>> getNowPlayingFilm() async {
    String url =
        '${Config.baseUrl}/3/movie/now_playing?api_key=${Config.apiKey}';

    try {
      Response response = await get(url);

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        NowPlayingFilmResponseModel nowPlayingFilmResponseModel =
            NowPlayingFilmResponseModel.fromJson(response.body);

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
      Response response = await get(url);

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        PopularFilmResponseModel popularFilmResponseModel =
            PopularFilmResponseModel.fromJson(response.body);

        return popularFilmResponseModel.results ?? [];
      } else {
        return [];
      }
    } on Exception catch (e) {
      return [];
    }
  }

  Future<List<FilmModel>> getTopRatedFilm() async {
    String url = '${Config.baseUrl}/3/movie/top_rated?api_key=${Config.apiKey}';

    try {
      Response response = await get(url);

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        PopularFilmResponseModel popularFilmResponseModel =
            PopularFilmResponseModel.fromJson(response.body);

        return popularFilmResponseModel.results ?? [];
      } else {
        return [];
      }
    } on Exception catch (e) {
      print('Ada Error nih : $e');
      return [];
    }
  }

  Future<List<Genre>> getListGenre() async {
    String url =
        '${Config.baseUrl}/3/genre/movie/list?api_key=${Config.apiKey}';

    try {
      Response response = await get(url);

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        GenreListJsonModel genreListJsonModel =
            GenreListJsonModel.fromJson(response.body);

        return genreListJsonModel.genres ?? [];
      } else {
        return [];
      }
    } on Exception catch (e) {
      return [];
    }
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/service/model/detailfilm_response_json.dart';
import 'package:mulai_flutter_2/service/model/video_json_model.dart';
import 'package:mulai_flutter_2/views/detailfilm/model/credits_film_model.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/service/model/genre_list.dart';
import 'package:mulai_flutter_2/service/model/nowplaying_response_model.dart';
import 'package:mulai_flutter_2/service/model/populafilm_response_model.dart';

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

  Future<List<FilmModel>> getNowUpcomingFilm() async {
    String url = '${Config.baseUrl}/3/movie/upcoming?api_key=${Config.apiKey}';

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

  Future<List<FilmModel>> getTrendingFilm() async {
    String url =
        '${Config.baseUrl}/3/trending/movie/day?api_key=${Config.apiKey}';

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

  Future<DetailFilmJsonModel> getDetailFilm(int filmId) async {
    String url = '${Config.baseUrl}/3/movie/$filmId?api_key=${Config.apiKey}';

    try {
      Response response = await get(url);

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        DetailFilmJsonModel detailFilmJsonModel =
            DetailFilmJsonModel.fromJson(response.body);

        return detailFilmJsonModel;
      } else {
        return DetailFilmJsonModel();
      }
    } on Exception catch (e) {
      print('Ada Error nih : $e');
      return DetailFilmJsonModel();
    }
  }

  Future<VideoJsonModel> getVideoFilm(int filmId) async {
    String url =
        '${Config.baseUrl}/3/movie/$filmId/videos?api_key=${Config.apiKey}';

    try {
      Response response = await get(url);

      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 203) {
        VideoJsonModel videoJsonModel = VideoJsonModel.fromJson(response.body);

        return videoJsonModel;
      } else {
        return VideoJsonModel();
      }
    } on Exception catch (e) {
      print('Ada Error nih : $e');
      return VideoJsonModel();
    }
  }

  Future<CreditsFilmModel> getCreditsFilm(int id) async {
    String url =
        '${Config.baseUrl}/3/movie/$id/credits?api_key=${Config.apiKey}';
    print(url);

    Response response = await get(url);
    print(response.body);

    if (response.statusCode == 200) {
      CreditsFilmModel creditsFilmModel =
          CreditsFilmModel.fromJson(response.body);

      return creditsFilmModel;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return CreditsFilmModel();
    }
  }
}

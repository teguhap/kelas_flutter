import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/service/get_film.dart';
import 'package:mulai_flutter_2/service/model/genre_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString username = ''.obs;
  RxList<FilmModel> listOfPopularFilm = <FilmModel>[].obs;
  RxList<FilmModel> listOfTopRatedFilm = <FilmModel>[].obs;
  RxList<FilmModel> listOfNowPlaying = <FilmModel>[].obs;
  RxList<Genre> listOfGenre = <Genre>[].obs;
  RxInt currentIndex = 0.obs;
  RxBool isLoadingPopular = true.obs;
  RxBool isLoadingNowPlaying = true.obs;
  RxBool isLoadingTopRated = true.obs;
  late SharedPreferences sharedPreferences;

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    username.value = sharedPreferences.getString('username') ?? 'Good Morning';
    Future.wait([
      getListGenre(),
      getNowPlayingFilm(),
      getPopularFilm(),
      getTopRatedFilm(),
    ]);
  }

  Future<void> getNowPlayingFilm() async {
    listOfNowPlaying.value = await GetFilm().getNowPlayingFilm();
    isLoadingNowPlaying.value = false;
  }

  Future<void> getPopularFilm() async {
    listOfPopularFilm.value = await GetFilm().getNowPopularFilm();
    isLoadingPopular.value = false;
  }

  Future<void> getTopRatedFilm() async {
    listOfTopRatedFilm.value = await GetFilm().getTopRatedFilm();
    isLoadingTopRated.value = false;
  }

  Future<void> getListGenre() async {
    listOfGenre.value = await GetFilm().getListGenre();
    Config.listOfGenres = listOfGenre;
  }
}

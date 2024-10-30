import 'package:get/get.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/views/home/service/get_film.dart';
import 'package:mulai_flutter_2/views/home/service/model/genre_list.dart';

class HomeController extends GetxController {
  RxList<FilmModel> listOfPopularFilm = <FilmModel>[].obs;
  RxList<FilmModel> listOfTopRatedFilm = <FilmModel>[].obs;
  RxList<FilmModel> listOfNowPlaying = <FilmModel>[].obs;
  RxList<Genre> listOfGenre = <Genre>[].obs;
  RxInt currentIndex = 0.obs;
  RxBool isLoadingPopular = true.obs;
  RxBool isLoadingNowPlaying = true.obs;
  RxBool isLoadingTopRated = true.obs;

  void init() {
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
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/views/home/home.dart';
import 'package:mulai_flutter_2/views/explore/views/explore_view.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/service/get_film.dart';
import 'package:mulai_flutter_2/views/profile/profile_detail/profile_view.dart';

class ExploreController extends GetxController
    with GetTickerProviderStateMixin {
  RxList<FilmModel> listOfUpcomingFilm = <FilmModel>[].obs;
  RxList<FilmModel> listOfTrendingFilm = <FilmModel>[].obs;

  late TabController tabController;

  RxInt currentIndex = 0.obs;
  RxBool isLoadingUpcoming = true.obs;
  RxBool isLoadingTrending = true.obs;
  RxBool isLoadingTopRated = true.obs;

  void init() {
    tabController = TabController(length: 4, vsync: this);
    Future.wait([
      getUpcomingFilm(),
      getTrendingFilm(),
    ]);
  }

  Future<void> getUpcomingFilm() async {
    listOfUpcomingFilm.value = await GetFilm().getNowUpcomingFilm();
    isLoadingUpcoming.value = false;
  }

  Future<void> getTrendingFilm() async {
    listOfTrendingFilm.value = await GetFilm().getTrendingFilm();
    isLoadingTrending.value = false;
  }
}

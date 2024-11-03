import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/service/model/genre_list.dart';
import 'package:mulai_flutter_2/views/home/widgets/film.dart';

class RowFilm extends StatelessWidget {
  String title;
  List<FilmModel> listOfFilm;
  List<Genre> listOfGenre;
  RxBool isLoadingValue;

  RowFilm(
      {super.key,
      required this.title,
      required this.listOfFilm,
      required this.listOfGenre,
      required this.isLoadingValue});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: colorPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            isLoadingValue.value
                ? Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CircularProgressIndicator(
                      color: colorPrimary,
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...listOfFilm.map(
                          (film) => Film(
                            filmModel: film,
                            listOfGenre: listOfGenre,
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

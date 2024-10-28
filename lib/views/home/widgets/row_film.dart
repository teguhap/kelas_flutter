import 'package:flutter/material.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/views/home/service/model/genre_list.dart';

class RowFilm extends StatelessWidget {
  FilmModel filmModel;
  List<Genre> listOfGenre;
  RowFilm({
    super.key,
    required this.filmModel,
    required this.listOfGenre,
  });

  String generateGenre() {
    String genres = '';

    List<String> genreNames = [];

    filmModel.genreIds?.forEach((genre) {
      final genreName = listOfGenre
          .firstWhere(
            (gen) => gen.id == genre,
            orElse: () => Genre(),
          )
          .name;

      genreNames.add(genreName ?? '');
    });

    genres = genreNames.join(', ');

    return genres;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 120,
        margin: EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '${Config.imageUrl}/original/${filmModel.posterPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Text(
              filmModel.title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              generateGenre(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

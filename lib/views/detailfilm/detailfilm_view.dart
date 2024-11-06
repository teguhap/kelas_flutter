import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/helper/helper.dart';
import 'package:mulai_flutter_2/service/get_film.dart';
import 'package:mulai_flutter_2/service/model/detailfilm_response_json.dart';
import 'package:mulai_flutter_2/service/model/genre_list.dart';
import 'package:mulai_flutter_2/service/model/video_json_model.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/detailfilm/model/credits_film_model.dart';
import 'package:mulai_flutter_2/views/detailfilm/video/video_view.dart';

class DetailfilmView extends StatefulWidget {
  int filmId;
  DetailfilmView({super.key, required this.filmId});

  @override
  State<DetailfilmView> createState() => _DetailfilmViewState();
}

class _DetailfilmViewState extends State<DetailfilmView> {
  DetailFilmJsonModel detailFilmModel = DetailFilmJsonModel();
  VideoJsonModel videoJsonModel = VideoJsonModel();
  CreditsFilmModel creditsFilmModel = CreditsFilmModel();
  bool isLoading = true;
  bool isFavourite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailFilm();
  }

  Future getDetailFilm() async {
    detailFilmModel = await GetFilm().getDetailFilm(widget.filmId);
    videoJsonModel = await GetFilm().getVideoFilm(widget.filmId);
    creditsFilmModel = await GetFilm().getCreditsFilm(widget.filmId);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: colorPrimary,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 400,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '${Config.imageUrl}/original/${detailFilmModel.backdropPath}',
                            ),
                          )),
                        ),
                        _header(context),
                      ],
                    ),
                  ),
                  _body(context),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
    );
  }

  _header(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity(0.4),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                  icon: isFavourite
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
            Spacer(),
            Text(
              detailFilmModel.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              detailFilmModel.tagline ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        (detailFilmModel.releaseDate ?? '')
                            .toString()
                            .substring(0, 4),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        Helper().convertMinutesToString(
                            detailFilmModel.runtime ?? 0),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.theaters,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        (detailFilmModel.genres ?? [Genre()])[0].name ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(VideoView(
                          videoId: videoJsonModel.results?.first.key ?? '',
                        ));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Play'),
                        ],
                      )),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorSecondary,
                          foregroundColor: colorPrimary,
                          shape: CircleBorder(),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Image.asset('assets/icons/ic_download.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorSecondary,
                            foregroundColor: colorPrimary,
                            shape: CircleBorder(),
                          ),
                          onPressed: () {},
                          child: Image.asset('assets/icons/ic_mirror.png')),
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorSecondary,
                            foregroundColor: colorPrimary,
                            shape: CircleBorder(),
                          ),
                          onPressed: () {},
                          child: Image.asset('assets/icons/ic_share.png')),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Story Line',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                detailFilmModel.overview ?? '-',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cast',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...(creditsFilmModel.cast ?? []).map((cast) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              color: colorSecondary,
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            children: [
                              cast.profilePath != null &&
                                      (cast.profilePath ?? '').isNotEmpty
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        '${Config.imageUrl}/original/${cast.profilePath ?? ''}',
                                      ),
                                    )
                                  : CircleAvatar(),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cast.name ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    cast.character ?? '',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/helper/helper.dart';
import 'package:mulai_flutter_2/service/get_film.dart';
import 'package:mulai_flutter_2/service/model/detailfilm_response_json.dart';
import 'package:mulai_flutter_2/service/model/video_json_model.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/detailfilm/video/video_view.dart';

class DetailfilmView extends StatefulWidget {
  int filmId;
  DetailfilmView({super.key, required this.filmId});

  @override
  State<DetailfilmView> createState() => _DetailfilmViewState();
}

class _DetailfilmViewState extends State<DetailfilmView> {
  bool isLoading = true;
  DetailFilmJsonModel detailFilm = DetailFilmJsonModel();
  VideoJsonModel videoJsonModel = VideoJsonModel();

  init() async {
    detailFilm = await GetFilm().getDetailFilm(widget.filmId);
    videoJsonModel = await GetFilm().getVideoFilm(widget.filmId);
    print(detailFilm.toJson());
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
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
            : Column(
                children: [
                  _header(),
                ],
              ));
  }

  _header() {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Container(
            height: 400,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${Config.imageUrl}/original/${detailFilm.posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 400,
              width: Get.width,
              color: Colors.black.withOpacity(0.4),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    detailFilm.title ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    detailFilm.tagline ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            detailFilm.releaseDate.toString().substring(0, 4),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Helper().convertMinutesToString(
                                detailFilm.runtime ?? 0),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_movies_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            detailFilm.genres?.first.name ?? '',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(VideoView(
                              videoId: videoJsonModel.results?.first.key ?? '',
                            ));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorSecondary,
                        ),
                        onPressed: () {},
                        child: Image.asset('assets/icons/ic_download.png'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorSecondary,
                        ),
                        onPressed: () {},
                        child: Image.asset('assets/icons/ic_mirror.png'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorSecondary,
                        ),
                        onPressed: () {},
                        child: Image.asset('assets/icons/ic_share.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

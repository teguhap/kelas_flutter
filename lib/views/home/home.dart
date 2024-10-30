import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/home/controller/home_controller.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/views/home/widgets/row_film.dart';

class HomeView extends GetView<HomeController> {
  String? nama;

  HomeView({super.key, this.nama});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(initState: (state) {
      controller.init();
    }, builder: (context) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Obx(
              () => Column(
                children: [
                  _appBar(),
                  _slideImage(),
                  _indicator(),
                  _rowFilm('Popular Film', controller.listOfPopularFilm),
                  _rowFilm('Top Film', controller.listOfTopRatedFilm),
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }

  _appBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://artriva.com/media/k2/galleries/20/d.jpg',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${nama}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Let\'s watch a movie',
                    style: TextStyle(fontSize: 12, color: Color(0xff8C8E98)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset('assets/icons/ic_search.png'),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _slideImage() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        height: 200,
        child: controller.isLoadingNowPlaying.value
            ? Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(
                    color: colorPrimary,
                  ),
                ),
              )
            : PageView.builder(
                // itemCount: listOfColors.length,
                onPageChanged: (value) {
                  var realIndex = value % controller.listOfNowPlaying.length;

                  controller.currentIndex.value = realIndex;
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: Get.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          '${Config.imageUrl}/original/${controller.listOfNowPlaying[controller.currentIndex.value].backdropPath}',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(colors: [
                              colorPrimary,
                              colorPrimary.withOpacity(0.9),
                              Colors.transparent,
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.listOfNowPlaying[index].title ??
                                      '',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.listOfNowPlaying[index].overview ??
                                      '',
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Text('Watch Now'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ));
  }

  _indicator() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < controller.listOfNowPlaying.length; i++)
            controller.currentIndex == i
                ? Container(
                    width: 24,
                    height: 8,
                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(100)),
                  )
                : Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
          // ...listOfColors.map(
          //   (e) => Container(
          //     width: 24,
          //     height: 8,
          //     margin: EdgeInsets.only(right: 3),
          //     decoration: BoxDecoration(
          //         color: colorPrimary,
          //         borderRadius: BorderRadius.circular(100)),
          //   ),
          // ),
        ],
      ),
    );
  }

  _rowFilm(String title, List<FilmModel> listOfFilm) {
    return Padding(
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
          controller.isLoadingPopular.value
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
                        (film) => RowFilm(
                          filmModel: film,
                          listOfGenre: controller.listOfGenre,
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

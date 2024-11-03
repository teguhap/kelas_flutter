import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mulai_flutter_2/config/config.dart';
import 'package:mulai_flutter_2/theme/theme.dart';
import 'package:mulai_flutter_2/views/explore/explore_controller.dart';
import 'package:mulai_flutter_2/views/home/model/film_model.dart';
import 'package:mulai_flutter_2/widgets/row_film.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(initState: (state) {
      controller.init();
    }, builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Explore'),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.35),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.35),
                                ),
                              ),
                              prefixIcon: Image.asset(
                                'assets/icons/ic_search3.png',
                                color: Colors.black,
                                scale: 1.3,
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xff7D7E83),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _carouselSlider(),
                  _indicator(),
                  _tabBar(),
                  RowFilm(
                      title: 'Popular Film',
                      listOfFilm: controller.listOfTrendingFilm,
                      listOfGenre: Config.listOfGenres,
                      isLoadingValue: controller.isLoadingTrending),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _carouselSlider() {
    return controller.isLoadingUpcoming.value
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                color: colorPrimary,
              ),
            ),
          )
        : CarouselSlider(
            items: [
                ...controller.listOfUpcomingFilm.map(
                  (film) => LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      height: 200,
                      child: Stack(
                        children: [
                          Container(
                            height: 160,

                            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${Config.imageUrl}/original${film.backdropPath ?? ''}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 50,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(0.1),
                                  ],
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Text(
                              film.title ?? '',
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                var realIndex = index % controller.listOfUpcomingFilm.length;

                controller.currentIndex.value = realIndex;
              },
              height: 160,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              // autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ));
  }

  _indicator() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < controller.listOfUpcomingFilm.length; i++)
            controller.currentIndex.value == i
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
        ],
      ),
    );
  }

  _tabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TabBar(
            controller: controller.tabController,
            indicatorColor: colorPrimary,
            labelColor: Colors.white,
            labelPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            indicatorPadding: EdgeInsets.symmetric(vertical: 10),
            unselectedLabelColor: Colors.black,
            labelStyle: const TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            indicator: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                child: Text(
                  'All',
                ),
              ),
              Tab(
                child: Text(
                  'Comdey',
                ),
              ),
              Tab(
                child: Text(
                  'Animation',
                ),
              ),
              Tab(
                child: Text(
                  'Documentary',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

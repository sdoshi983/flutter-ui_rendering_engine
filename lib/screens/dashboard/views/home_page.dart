import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ui_rendering_engine/models/models.dart';
import 'package:ui_rendering_engine/screens/screens.dart';
import 'package:ui_rendering_engine/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  late JsonDataModel jsonData;

  @override
  void initState() {
    super.initState();
    fetchJsonData(); // fetching json data
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    Constants.isLightTheme = jsonData.app?.theme == AppTheme.light.name;

    return Scaffold(
      backgroundColor: Constants.isLightTheme ? AppColors.white : AppColors.chineseBlack,
      appBar: AppBar(
        backgroundColor: AppColors.lightThemeColor,
        elevation: 5,
        title: const Text(
          'UI Rendering Engine',
          style: tsWhite20600,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: context.screenHeight,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: jsonData.widgets?.length ?? 0,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.04,
                      vertical: context.screenHeight * 0.03,
                    ),
                    itemBuilder: (_, index) {
                      Widget widgetToBeRendered = const SizedBox.shrink();

                      // rendering the widgets of type banner
                      if (jsonData.widgets?[index].type == WidgetType.banner.type) {
                        widgetToBeRendered = BannerWidget(bannerWidgetData: jsonData.widgets?[index]);
                      }

                      // rendering the widgets of type horizontal list
                      if (jsonData.widgets?[index].type == WidgetType.horizontalList.type) {
                        widgetToBeRendered = Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              jsonData.widgets?[index].title ?? '',
                              style: Constants.isLightTheme
                                  ? tsBlack20600
                                  : tsBlack20600.copyWith(
                                      color: AppColors.white,
                                    ),
                            ),
                            SizedBox(height: context.screenHeight * 0.025),
                            Container(
                              height: context.screenHeight * 0.23,
                              padding: EdgeInsets.only(
                                top: jsonData.widgets?[index].paddingTop ?? 0.0,
                                bottom: jsonData.widgets?[index].paddingBottom ?? 0.0,
                                left: jsonData.widgets?[index].paddingLeft ?? 0.0,
                                right: jsonData.widgets?[index].paddingRight ?? 0.0,
                              ),
                              child: ListView.builder(
                                itemCount: jsonData.widgets?[index].items?.length ?? 0,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, itemIndex) {
                                  return Container(
                                    width: context.screenWidth * 0.35,
                                    padding: EdgeInsets.only(
                                      right: context.screenWidth * 0.04,
                                      bottom: context.screenHeight * 0.02,
                                    ),
                                    child: HorizontalListWidget(
                                      itemData: jsonData.widgets?[index].items?[itemIndex],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }

                      // rendering the widgets of type banner carousel
                      if (jsonData.widgets?[index].type == WidgetType.bannerCarousel.type) {
                        widgetToBeRendered = Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Banner Carousel',
                              style: Constants.isLightTheme
                                  ? tsBlack20600
                                  : tsBlack20600.copyWith(
                                      color: AppColors.white,
                                    ),
                            ),
                            SizedBox(height: context.screenHeight * 0.025),
                            if (jsonData.widgets?[index].items == null || jsonData.widgets![index].items!.length < 2)
                              SizedBox(         // displaying placeholder if data is not valid
                                height: context.screenHeight * 0.15,
                                child: const Center(
                                  child: PlaceholderWidget()
                                ),
                              )
                            else
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: context.screenHeight * 0.2,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: List.generate(
                                  jsonData.widgets![index].items!.length,
                                  (itemIndex) => BannerWidget(
                                    bannerWidgetDataAsCarouselItems: jsonData.widgets![index].items![itemIndex],
                                    widgetType: WidgetType.bannerCarousel,
                                  ),
                                ),
                              ),
                          ],
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.only(bottom: context.screenHeight * 0.05),
                        child: widgetToBeRendered,
                      );
                    },
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchJsonData() async {
    final String jsonString = await rootBundle.loadString(jsonDataAssetPath);
    final mapData = jsonDecode(jsonString); // decoding json string to map
    jsonData = JsonDataModel.fromJson(mapData); // converting raw data to dart model
    setState(() {
      isLoading = false;
    });
  }
}

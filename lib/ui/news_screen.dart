import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:techify_assesment/bloc/bookmark_bloc.dart';
import 'package:techify_assesment/bloc/news_bloc.dart';
import 'package:techify_assesment/constant/color_constant.dart';
import 'package:techify_assesment/constant/global_variable.dart';
import 'package:techify_assesment/model/response/news_response.dart';
import 'package:techify_assesment/route/route_constant.dart';
import 'package:techify_assesment/state/news_state.dart';
import 'package:techify_assesment/utility/app_utility.dart';
import 'package:techify_assesment/widget/news_tile.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsBloc _newsBloc;
  late BookmarkBloc _bookmarkBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = NewsBloc();
    _bookmarkBloc = BookmarkBloc();
    _newsBloc.fetchNews();
  }

  @override
  void dispose() {
    super.dispose();
    _newsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<NewsState>(
          stream: _newsBloc.newsState,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state?.isLoading() ?? false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state?.isError() ?? false) {
              return Center(
                child: Text(
                  state?.error.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              );
            }
            if (state?.data == null) {
              const Center(
                child: Text(
                  "No data found",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              );
            }
            if (state?.isCompleted() ?? false) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                children: [
                  CarouselSlider(
                    items: [
                      for (int i = 0; i < GlobalVariable.sliderImages.length; i++)
                        _slider(img: GlobalVariable.sliderImages[i], articles: state?.data?[i])
                    ],
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.2,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        _newsBloc.sliderIndex.add(index);
                      },
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  StreamBuilder<int>(
                    initialData: 0,
                    stream: _newsBloc.sliderIndex,
                    builder: (context, snapshot) {
                      final index = snapshot.data;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < GlobalVariable.sliderImages.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: i == index ? ColorConst.tabColor : ColorConst.grey,
                              ),
                            )
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Latest News",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state?.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteConstant.detailScreen,
                            arguments: state.data?[index],
                          );
                        },
                        child: NewsTile(
                          articles: state!.data![index],
                          bookmarkBloc: _bookmarkBloc,
                        ),
                      );
                    },
                  )
                ],
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }

  Widget _slider({required String img, required Articles? articles}) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(img),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppUtility.getTimeFromDate(articles?.publishedAt.toString()),
                style: const TextStyle(
                  color: ColorConst.scaffoldColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              StreamBuilder<List<Articles>>(
                stream: _bookmarkBloc.bookMarkList,
                builder: (context, snapshot) {
                  final bookmark = _bookmarkBloc.bookMarkList.valueOrNull
                          ?.any((b) => b.description == articles?.description) ??
                      false;
                  return IconButton(
                    onPressed: () => _bookmarkBloc.addToBookMark(articles!, context),
                    icon: Icon(
                      Icons.bookmark,
                      color: bookmark ? ColorConst.tabColor : ColorConst.scaffoldColor,
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              articles?.content?.toString() ?? "",
              maxLines: 2,
              style: const TextStyle(
                color: ColorConst.scaffoldColor,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        )
      ],
    );
  }
}

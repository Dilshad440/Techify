import 'package:flutter/material.dart';
import 'package:techify_assesment/bloc/bookmark_bloc.dart';
import 'package:techify_assesment/constant/color_constant.dart';
import 'package:techify_assesment/model/response/news_response.dart';
import 'package:techify_assesment/utility/app_utility.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.articles, required this.bookmarkBloc}) : super(key: key);
  final Articles articles;
  final BookmarkBloc bookmarkBloc;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(articles.urlToImage!),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles.description.toString(),
                  maxLines: 4,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppUtility.getTimeFromDate(articles.publishedAt.toString()),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    StreamBuilder<List<Articles>>(
                      stream: bookmarkBloc.bookMarkList,
                      builder: (context, snapshot) {
                        final bookmark =
                            snapshot.data?.any((b) => b.description == articles.description) ?? false;
                        return IconButton(
                          onPressed: () => bookmarkBloc.addToBookMark(articles, context),
                          icon: Icon(
                            Icons.bookmark,
                            color: bookmark ? ColorConst.tabColor : ColorConst.grey,
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

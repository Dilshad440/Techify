import 'package:flutter/material.dart';
import 'package:techify_assesment/constant/color_constant.dart';
import 'package:techify_assesment/model/response/news_response.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key, required this.articles}) : super(key: key);
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              articles.urlToImage.toString(),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: ColorConst.tabColor, width: 4),
                    ),
                  ),
                  child: Text(
                    articles.title.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  articles.description.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
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

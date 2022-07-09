import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:line_today_clone/model/news_service/article.dart';
import 'package:line_today_clone/util/constant.dart';

class ArticleCarousel extends StatefulWidget {
  const ArticleCarousel({Key? key, required this.articles}) : super(key: key);
  final List<NewsArticle> articles;

  @override
  State<ArticleCarousel> createState() => _ArticleCarouselState();
}

class _ArticleCarouselState extends State<ArticleCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: size.width * (9 / 16),
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() => _current = index);
            },
          ),
          carouselController: _controller,
          items: widget.articles.map((element) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(element.urlToImage, fit: BoxFit.cover);
              },
            );
          }).toList(),
        ),
        Column(
          children: [
            buildIndicators(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.articles[_current].title,
                style: Font.HEADING_3,
                maxLines: 3,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.articles.asMap().entries.map((entry) {
        return Expanded(
          child: Container(
            height: 6.0,
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: MColor.PRIMARY_COLOR[_current == entry.key ? 500 : 100],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

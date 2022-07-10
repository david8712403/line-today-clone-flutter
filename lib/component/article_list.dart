import 'package:flutter/material.dart';
import 'package:line_today_clone/model/news_service/article.dart';
import 'package:line_today_clone/util/constant.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({
    Key? key,
    required this.articles,
    required this.onArticlePressed,
  }) : super(key: key);
  final List<NewsArticle> articles;
  final void Function(NewsArticle article) onArticlePressed;

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: widget.articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => widget.onArticlePressed(widget.articles[index]),
          child: ListTile(
            title: ArticleListItem(article: widget.articles[index]),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Dimen.DEF_MARGIN,
            ),
          ),
        );
      },
    );
  }
}

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({Key? key, required this.article}) : super(key: key);
  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width / 3;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: imageWidth,
          height: imageWidth * (9 / 16),
          child: Image.network(
            article.urlToImage,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            height: imageWidth * (9 / 16),
            padding: const EdgeInsets.symmetric(horizontal: Dimen.DEF_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: Dimen.HEADING_3_TEXT_SIZE,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  article.source.name,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

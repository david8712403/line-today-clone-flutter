import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:line_today_clone/component/article_carousel.dart';
import 'package:line_today_clone/component/article_list.dart';
import 'package:line_today_clone/component/category_list.dart';
import 'package:line_today_clone/component/dialogs.dart';
import 'package:line_today_clone/model/news_category.dart';
import 'package:line_today_clone/model/news_service/article.dart';
import 'package:line_today_clone/model/news_service/request/top_headlines_request.dart';
import 'package:line_today_clone/model/news_service/response/everything_response.dart';
import 'package:line_today_clone/service/news_service.dart';
import 'package:line_today_clone/util/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  NewsResponse? _data;
  bool _loading = true;

  void _onAritclePressed(NewsArticle article) async {
    log("article ${article.title} pressed");
    if (!await launchUrl(Uri.parse(article.url))) {
      showDialog(
        context: context,
        builder: (x) => MAlertDialog(
          errorTitle: "Erorr",
          errorDetail: 'Could not launch ${article.url}',
        ),
      );
    }
  }

  void _onCategoryChanged(NewsCategory category) {
    log("$category pressed");
    setState(() => _loading = true);
    NewsService.fetchTopHeadlines(
            TopHeadlinesRequest(category: category.name, country: "tw"))
        .then((value) {
      setState(() => _data = value);
    }).whenComplete(() => setState(() => _loading = false));
  }

  @override
  void initState() {
    super.initState();
    _onCategoryChanged(NewsCategory.business);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                top: Dimen.DEF_MARGIN,
                left: Dimen.DEF_MARGIN,
              ),
              child: Text(
                S.of(context).app_name,
                style: const TextStyle(
                  color: MColor.PRIMARY_COLOR,
                  fontSize: Dimen.HEADING_1_TEXT_SIZE,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimen.DEF_MARGIN),
            child: CategoryList(onCategoryChanged: _onCategoryChanged),
          ),
          buildBody()
        ],
      ),
    );
  }

  Widget buildBody() {
    List<Widget> widgets = _loading
        ? [const Center(child: CircularProgressIndicator())]
        : [
            _data == null
                ? Text(S.of(context).something_wrong)
                : ArticleCarousel(
                    articles: _data!.articles.getRange(0, 5).toList(),
                    onArticlePressed: _onAritclePressed),
            const SizedBox(height: Dimen.DEF_MARGIN),
            ArticleList(
              articles: _data!.articles
                  .getRange(5, _data!.articles.length - 1)
                  .toList(),
              onArticlePressed: _onAritclePressed,
            )
          ];
    return Expanded(
      child: SingleChildScrollView(
        primary: true,
        child: Column(children: widgets),
      ),
    );
  }
}

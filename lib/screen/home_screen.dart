import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:line_today_clone/component/category_list.dart';
import 'package:line_today_clone/model/news_service/request/everything_request.dart';
import 'package:line_today_clone/model/news_service/response/everything_response.dart';
import 'package:line_today_clone/service/news_service.dart';
import 'package:line_today_clone/util/constant.dart';

import '../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  NewsEverythingResponse? _data;
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
            child: CategoryList(onCategoryChanged: (category) {
              log("$category pressed");
              NewsService.fetchEverything(EverythingRequest()).then((value) {
                setState(() => _data = value);
              });
            }),
          ),
          // TODO: Top-headlines & list
          Expanded(
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                children: _data == null
                    ? []
                    : _data!.articles.map((e) => Text(e.toString())).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

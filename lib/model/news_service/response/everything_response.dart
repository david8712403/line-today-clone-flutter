import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:line_today_clone/model/news_service/article.dart';

class NewsEverythingResponse {
  final int totalResults;
  final List<NewsArticle> articles;

  NewsEverythingResponse({required this.totalResults, required this.articles});

  NewsEverythingResponse copyWith({
    int? totalResults,
    List<NewsArticle>? articles,
  }) {
    return NewsEverythingResponse(
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsEverythingResponse.fromMap(Map<String, dynamic> map) {
    return NewsEverythingResponse(
      totalResults: map['totalResults']?.toInt() ?? 0,
      articles: List<NewsArticle>.from(
          map['articles']?.map((x) => NewsArticle.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsEverythingResponse.fromJson(String source) =>
      NewsEverythingResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewsEverythingResponse(totalResults: $totalResults, articles: $articles)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsEverythingResponse &&
        other.totalResults == totalResults &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode => totalResults.hashCode ^ articles.hashCode;
}

import 'dart:convert';

class TopHeadlinesRequest {
  final String? country;
  final String? category;
  final String? sources;
  final String? q;
  final int? pageSize;
  final int? page;
  TopHeadlinesRequest({
    this.country,
    this.category,
    this.sources,
    this.q,
    this.pageSize,
    this.page,
  });

  TopHeadlinesRequest copyWith({
    String? country,
    String? category,
    String? sources,
    String? q,
    int? pageSize,
    int? page,
  }) {
    return TopHeadlinesRequest(
      country: country ?? this.country,
      category: category ?? this.category,
      sources: sources ?? this.sources,
      q: q ?? this.q,
      pageSize: pageSize ?? this.pageSize,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'category': category,
      'sources': sources,
      'q': q,
      'pageSize': pageSize,
      'page': page,
    };
  }

  factory TopHeadlinesRequest.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesRequest(
      country: map['country'],
      category: map['category'],
      sources: map['sources'],
      q: map['q'],
      pageSize: map['pageSize']?.toInt(),
      page: map['page']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TopHeadlinesRequest.fromJson(String source) =>
      TopHeadlinesRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TopHeadlinesRequest(country: $country, category: $category, sources: $sources, q: $q, pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopHeadlinesRequest &&
        other.country == country &&
        other.category == category &&
        other.sources == sources &&
        other.q == q &&
        other.pageSize == pageSize &&
        other.page == page;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        category.hashCode ^
        sources.hashCode ^
        q.hashCode ^
        pageSize.hashCode ^
        page.hashCode;
  }
}

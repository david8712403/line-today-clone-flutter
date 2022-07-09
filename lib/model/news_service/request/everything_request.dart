import 'dart:convert';

class EverythingRequest {
  final String? q;
  final String? searchIn;
  final String? sources;
  final String? domains;
  final String? excludeDomains;
  final DateTime? from;
  final DateTime? to;
  final String? language;
  final String? sortBy;
  final int? pageSize;
  final int? page;
  EverythingRequest({
    this.q,
    this.searchIn,
    this.sources,
    this.domains,
    this.excludeDomains,
    this.from,
    this.to,
    this.language,
    this.sortBy,
    this.pageSize,
    this.page,
  });

  EverythingRequest copyWith({
    String? q,
    String? searchIn,
    String? sources,
    String? domains,
    String? excludeDomains,
    DateTime? from,
    DateTime? to,
    String? language,
    String? sortBy,
    int? pageSize,
    int? page,
  }) {
    return EverythingRequest(
      q: q ?? this.q,
      searchIn: searchIn ?? this.searchIn,
      sources: sources ?? this.sources,
      domains: domains ?? this.domains,
      excludeDomains: excludeDomains ?? this.excludeDomains,
      from: from ?? this.from,
      to: to ?? this.to,
      language: language ?? this.language,
      sortBy: sortBy ?? this.sortBy,
      pageSize: pageSize ?? this.pageSize,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'q': q,
      'searchIn': searchIn,
      'sources': sources,
      'domains': domains,
      'excludeDomains': excludeDomains,
      'from': from?.toIso8601String(),
      'to': to?.toIso8601String(),
      'language': language,
      'sortBy': sortBy,
      'pageSize': pageSize,
      'page': page,
    };
  }

  factory EverythingRequest.fromMap(Map<String, dynamic> map) {
    return EverythingRequest(
      q: map['q'],
      searchIn: map['searchIn'],
      sources: map['sources'],
      domains: map['domains'],
      excludeDomains: map['excludeDomains'],
      from: map['from'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['from'])
          : null,
      to: map['to'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['to'])
          : null,
      language: map['language'],
      sortBy: map['sortBy'],
      pageSize: map['pageSize']?.toInt(),
      page: map['page']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory EverythingRequest.fromJson(String source) =>
      EverythingRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EverythingRequest(q: $q, searchIn: $searchIn, sources: $sources, domains: $domains, excludeDomains: $excludeDomains, from: $from, to: $to, language: $language, sortBy: $sortBy, pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EverythingRequest &&
        other.q == q &&
        other.searchIn == searchIn &&
        other.sources == sources &&
        other.domains == domains &&
        other.excludeDomains == excludeDomains &&
        other.from == from &&
        other.to == to &&
        other.language == language &&
        other.sortBy == sortBy &&
        other.pageSize == pageSize &&
        other.page == page;
  }

  @override
  int get hashCode {
    return q.hashCode ^
        searchIn.hashCode ^
        sources.hashCode ^
        domains.hashCode ^
        excludeDomains.hashCode ^
        from.hashCode ^
        to.hashCode ^
        language.hashCode ^
        sortBy.hashCode ^
        pageSize.hashCode ^
        page.hashCode;
  }
}

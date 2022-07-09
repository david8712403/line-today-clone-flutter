import 'dart:convert';

class NewsResponseBase {
  final String status;
  final String code;
  final String message;
  NewsResponseBase({
    required this.status,
    required this.code,
    required this.message,
  });

  NewsResponseBase copyWith({
    String? status,
    String? code,
    String? message,
  }) {
    return NewsResponseBase(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'code': code,
      'message': message,
    };
  }

  factory NewsResponseBase.fromMap(Map<String, dynamic> map) {
    return NewsResponseBase(
      status: map['status'] ?? '',
      code: map['code'] ?? '',
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResponseBase.fromJson(String source) =>
      NewsResponseBase.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewsResponseBase(status: $status, code: $code, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsResponseBase &&
        other.status == status &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ code.hashCode ^ message.hashCode;
}

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:line_today_clone/model/news_service/request/everything_request.dart';
import 'package:line_today_clone/model/news_service/response/everything_response.dart';
import 'package:line_today_clone/model/news_service/response/response_base.dart';
import 'package:line_today_clone/util/constant.dart';

class NewsService {
  static late Dio instance;
  static late String _apiKey;
  static late BaseOptions _config;
  static Map<String, dynamic>? _headers() => {
        'Accept': 'application/json, text/plain, */*',
        "Authorization": 'Bearer $_apiKey',
        "Content-Type": "application/json",
      };

  static Future init() async {
    final _apiHost = dotenv.env[MKey.API_HOST] ?? "";
    _apiKey = dotenv.env[MKey.API_KEY] ?? "";
    _config = BaseOptions(
      baseUrl: _apiHost,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    );
    instance = Dio(_config);
    instance.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      final base = NewsResponseBase.fromMap(response.data);
      if (base.status == "ok") {
        return handler.next(response);
      } else {
        handler.reject(
          DioError(
            error: "${base.code}: ${base.message}",
            response: response,
            requestOptions: RequestOptions(path: ""),
          ),
          true,
        );
      }
    }));
  }

  static Future<NewsEverythingResponse> fetchEverything(
      EverythingRequest request) async {
    final response = await instance.get(
      "/v2/everything",
      queryParameters: request.toMap(),
      options: Options(headers: _headers()),
    );
    return NewsEverythingResponse.fromMap(response.data);
  }
}

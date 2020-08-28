import 'package:app/model/article_response.dart';
import 'package:app/model/source_response.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "Here is your api";

  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadlineUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "us"};

    try {
      Response response =
          await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrce: $stacktrace");
      return SourceResponse.withError(error);
    }
  }

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {"apiKey": apiKey, "country": "us"};

    try {
      Response response =
          await _dio.get(getTopHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getHotNews() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};

    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error) {
      return ArticleResponse.withError(error);
    }
  }
}

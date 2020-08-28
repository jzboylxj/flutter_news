import 'package:app/model/article.dart';

class ArticleResponse {
  final List<SourceModel> articles;
  final String error;

  ArticleResponse(this.articles, this.error);

  ArticleResponse.fromJson(Map<String, dynamic> json)
      : articles = (json["articles"] as List)
            .map((i) => new SourceModel.fromJson(i))
            .toList(),
        error = "";

  ArticleResponse.withError(String errorValue)
      : articles = List(),
        error = errorValue;
}

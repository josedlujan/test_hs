import 'package:headspace_mobile_engineering/features/daily_news/data/models/article.dart';

class ArticleResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;
  const ArticleResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> jsonMap) {
    final parsedArticles = (jsonMap['articles'] ?? [])
        .map<ArticleModel>((item) => ArticleModel.fromJson(item))
        .toList();
    return ArticleResponse(
      status: jsonMap['status'] ?? '',
      totalResults: jsonMap['totalResults'] ?? 0,
      articles: parsedArticles,
    );
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:headspace_mobile_engineering/core/resources/data_state.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/entities/article.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataSet<List<ArticleModel>>> getNewsArticles() async {
    final httpResponse = await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data.articles);
    } else {
      return DataFailed(
        DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() async {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }
}

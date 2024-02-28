import 'package:dio/dio.dart';
import 'package:headspace_mobile_engineering/core/resources/data_state.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/entities/article.dart';

class ArticleEntityConstants {
  static const List<ArticleEntity> listOfArticleEntities = [
    ArticleEntity(),
    ArticleEntity(),
    ArticleEntity(),
  ];
  static DataSet<List<ArticleEntity>> dataSetListOfArticleEntities =
      DataSuccess(
    listOfArticleEntities,
  );

  static DioException dioException =
      DioException(requestOptions: RequestOptions(), error: 'Test Error');

  static DataSet<List<ArticleEntity>> dataSetListOfArticleError =
      DataFailed(dioException);

  static const articleEntity = ArticleEntity(
    id: 1,
    author: authorValue,
    title: titleValue,
    description: descriptionValue,
  );

  static const authorValue = 'Test Author';
  static const titleValue = 'Test Title';
  static const descriptionValue = 'Test Description';
}

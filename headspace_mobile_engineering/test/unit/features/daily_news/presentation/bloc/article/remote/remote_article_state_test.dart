import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/entities/article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

void main() {
  group('RemoteArticlesState tests', () {
    test('Equality for loading state', () {
      expect(
          const RemoteArticlesLoading(), equals(const RemoteArticlesLoading()));
      expect(const RemoteArticlesLoading(),
          isNot(equals(const RemoteArticlesDone([]))));
    });

    test('Equality for done state', () {
      const articleEntityA = ArticleEntity(
          id: 2,
          author: 'Jane Doe',
          title: 'Another Test Article',
          description: 'This is another test description',
          url: 'http://example.com/another',
          urlToImage: 'http://example.com/another/image.jpg',
          publishedAt: '2021-05-02T13:45:67Z',
          content: 'This is another piece of test content');
      const articleEntityB = ArticleEntity(
          id: 4,
          author: 'Jane Doe',
          title: 'Another Test Article',
          description: 'This is another test description',
          url: 'http://example.com/another',
          urlToImage: 'http://example.com/another/image.jpg',
          publishedAt: '2021-05-02T13:45:67Z',
          content: 'This is another piece of test content');
      final articles = [articleEntityA, articleEntityB];
      expect(
          RemoteArticlesDone(articles), equals(RemoteArticlesDone(articles)));
      expect(RemoteArticlesDone(articles),
          isNot(equals(const RemoteArticlesDone([]))));
    });

    test('Equality for error state', () {
      final error = DioException(
        requestOptions: RequestOptions(path: 'https://example.com'),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: 'https://example.com'),
        ),
      ); // Create a sample error
      expect(RemoteArticlesError(error), equals(RemoteArticlesError(error)));
      // expect(RemoteArticlesError(error), isNot(equals(const RemoteArticlesError(DioException(...)))));
    });

    test('Props for loading state', () {
      expect(const RemoteArticlesLoading().props,
          ['articles: null', 'error: null']);
    });

    /* test('Props for done state', () {
      final articles = [ArticleEntity(...), ArticleEntity(...)];
      expect(const RemoteArticlesDone(articles).props, ['articles: $articles', 'error: null']);
    });*/

    /* test('Props for error state', () {
      final error = DioError(...);
      expect(const RemoteArticlesError(error).props, ['articles: null', 'error: $error']);
    });*/
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/entities/article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

void main() {
  group('LocalArticlesEvent tests', () {
    test('GetSavedArticles equality', () {
      expect(const GetSavedArticles(), equals(const GetSavedArticles()));
    });

    test('GetSavedArticles props', () {
      expect(const GetSavedArticles().props, [null]);
    });

    test('SaveArticle equality', () {
      const articleEntity = ArticleEntity(
          id: 2,
          author: 'Jane Doe',
          title: 'Another Test Article',
          description: 'This is another test description',
          url: 'http://example.com/another',
          urlToImage: 'http://example.com/another/image.jpg',
          publishedAt: '2021-05-02T13:45:67Z',
          content: 'This is another piece of test content');
      expect(const SaveArticle(articleEntity),
          equals(const SaveArticle(articleEntity)));
    });

    test('SaveArticle props', () {
      const articleEntity = ArticleEntity(
          id: 2,
          author: 'Jane Doe',
          title: 'Another Test Article',
          description: 'This is another test description',
          url: 'http://example.com/another',
          urlToImage: 'http://example.com/another/image.jpg',
          publishedAt: '2021-05-02T13:45:67Z',
          content: 'This is another piece of test content');
      expect(const SaveArticle(articleEntity).props, [articleEntity]);
    });

    test('RemoveArticle props', () {
      const articleEntity = ArticleEntity(
          id: 2,
          author: 'Jane Doe',
          title: 'Another Test Article',
          description: 'This is another test description',
          url: 'http://example.com/another',
          urlToImage: 'http://example.com/another/image.jpg',
          publishedAt: '2021-05-02T13:45:67Z',
          content:
              'This is another piece of test content'); // Crear un artículo de muestra

      expect(RemoveArticle(articleEntity).props, [articleEntity]);
    });

    test('RemoveArticle with null article', () {
      expect(() => RemoveArticle(null), throwsA(isA<AssertionError>()));
    });
  });
}

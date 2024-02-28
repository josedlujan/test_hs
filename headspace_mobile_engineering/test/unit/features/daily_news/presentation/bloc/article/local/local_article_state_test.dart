import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/entities/article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

void main() {
  group('LocalArticlesState tests', () {
    // Test de igualdad para la clase abstracta
    test('LocalArticlesState equality', () {
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

      final stateA = LocalArticlesDone(articles);
      final stateB = LocalArticlesDone(articles);
      final stateC = LocalArticlesLoading(); // Crear lista de artículos
      expect(stateA, equals(stateB));
      expect(stateA, isNot(equals(stateC)));
    });

    // Test de props para la clase abstracta
    test('LocalArticlesState props', () {
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
      final state = LocalArticlesDone(articles);
      expect(state.props, [articles]);
    });

    test('LocalArticlesLoading equality', () {
      expect(LocalArticlesLoading(), equals(LocalArticlesLoading()));
    });

    test('LocalArticlesDone equality', () {
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
      expect(LocalArticlesDone(articles), equals(LocalArticlesDone(articles)));
      expect(LocalArticlesDone(articles),
          isNot(equals(const LocalArticlesDone([]))));
    });

    test('LocalArticlesDone props', () {
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
      expect(LocalArticlesDone(articles).props, [articles]);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit(); // Initialize sqflite_common_ffi

  group('ArticleDao tests', () {
    /* late ArticleDao articleDao;

    setUp(() async {
      final database = await FloorTest.setup();
      articleDao = database.articleDao;
    });

    test('insertArticle inserts article correctly', () async {
      final article = ArticleModel(id: 1, title: 'Test Article', ...);
      await articleDao.insertArticle(article);

      final allArticles = await articleDao.getArticles();
      expect(allArticles, [article]);
    });

    test('deleteArticle removes article correctly', () async {
      final article = ArticleModel(id: 1, title: 'Test Article', ...);
      await articleDao.insertArticle(article);

      await articleDao.deleteArticle(article);

      final allArticles = await articleDao.getArticles();
      expect(allArticles, isEmpty);
    });

    test('getArticles returns all inserted articles', () async {
      final articles = [
        ArticleModel(id: 1, title: 'Article 1', ...),
        ArticleModel(id: 2, title: 'Article 2', ...),
        ArticleModel(id: 3, title: 'Article 3', ...),
      ];

      for (final article in articles) {
        await articleDao.insertArticle(article);
      }

      final allArticles = await articleDao.getArticles();
      expect(allArticles, equals(articles));
    });

    // ... (tests for edge cases and error handling)
  });*/
  });
}

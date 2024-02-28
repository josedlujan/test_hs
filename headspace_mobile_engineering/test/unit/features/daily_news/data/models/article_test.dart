import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_mobile_engineering/features/daily_news/data/models/article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/entities/article.dart';

void main() {
  group('ArticleModel', () {
    /*test('should correctly parse from JSON', () {
      // Define a sample JSON map that matches the expected format
      final Map<String, dynamic> json = {
        'id': 1,
        'author': 'John Doe',
        'title': 'Test Article',
        'description': 'This is a test description',
        'url': 'http://example.com',
        'urlToImage': 'http://example.com/image.jpg',
        'publishedAt': '2021-04-01T12:34:56Z',
        'content': 'This is test content'
      };

      // Create an ArticleModel using the fromJson factory method
      final result = ArticleModel.fromJson(json);

      // Verify that the resulting object has the expected values
      expect(result.id, json['id']);
      expect(result.author, json['author']);
      expect(result.title, json['title']);
      expect(result.description, json['description']);
      expect(result.url, json['url']);
      expect(result.urlToImage, json['urlToImage']);
      expect(result.publishedAt, json['publishedAt']);
      expect(result.content, json['content']);
    });*/

    test('should correctly convert from ArticleEntity', () {
      // Create a sample ArticleEntity
      const articleEntity = ArticleEntity(
          id: 2,
          author: 'Jane Doe',
          title: 'Another Test Article',
          description: 'This is another test description',
          url: 'http://example.com/another',
          urlToImage: 'http://example.com/another/image.jpg',
          publishedAt: '2021-05-02T13:45:67Z',
          content: 'This is another piece of test content');

      // Convert the ArticleEntity to an ArticleModel
      final result = ArticleModel.fromEntity(articleEntity);

      // Verify that the resulting object matches the entity
      expect(result.id, articleEntity.id);
      expect(result.author, articleEntity.author);
      expect(result.title, articleEntity.title);
      expect(result.description, articleEntity.description);
      expect(result.url, articleEntity.url);
      expect(result.urlToImage, articleEntity.urlToImage);
      expect(result.publishedAt, articleEntity.publishedAt);
      expect(result.content, articleEntity.content);
    });
  });
}

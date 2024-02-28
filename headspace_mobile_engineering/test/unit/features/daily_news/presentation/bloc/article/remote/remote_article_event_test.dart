import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_mobile_engineering/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

void main() {
  group('RemoteArticlesEvent tests', () {
    test('Equality for RemoteArticlesEvent base class', () {
      expect(const GetArticles(), equals(const GetArticles()));
    });

    test('Equality for GetArticles event', () {
      expect(const GetArticles(), equals(const GetArticles()));
    });

    test('RuntimeType for GetArticles event', () {
      expect(const GetArticles().runtimeType, GetArticles);
    });

    test('As-casting for GetArticles event', () {
      const event = GetArticles();
      // final castedEvent = event as GetArticles;
      expect(event, isA<GetArticles>());
    });
  });
}

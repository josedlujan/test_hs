import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:headspace_mobile_engineering/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../constants/article_entity_constants.dart';
import '../../../../../../helpers/mock_helpers.mocks.dart';

void main() {
  late RemoteArticlesBloc remoteArticlesBloc;
  final mockGetSavedArticleUseCase = MockGetArticleUseCase();
  setUp(() {
    remoteArticlesBloc = RemoteArticlesBloc(
      mockGetSavedArticleUseCase,
    );
  });

  group('RemoteArticles tests', () {
    setUp(() {
      when(mockGetSavedArticleUseCase.call()).thenAnswer(
        (_) async => ArticleEntityConstants.dataSetListOfArticleEntities,
      );
    });

    blocTest(
      'emits [] when nothing is added is emitted',
      build: () => remoteArticlesBloc,
      expect: () => [],
    );

    blocTest(
      'emits [] when getSavedArticle event is launched',
      build: () => remoteArticlesBloc,
      act: (bloc) => bloc.add(const GetArticles()),
      expect: () => [
        const RemoteArticlesDone(
          ArticleEntityConstants.listOfArticleEntities,
        )
      ],
    );
  });

  group('RemoteArticles exceptions', () {
    setUp(() {
      when(mockGetSavedArticleUseCase.call()).thenAnswer(
        (_) async => ArticleEntityConstants.dataSetListOfArticleError,
      );
    });

    blocTest(
      'emits exception when getSavedArticle event is launched',
      build: () => remoteArticlesBloc,
      act: (bloc) => bloc.add(const GetArticles()),
      expect: () => [RemoteArticlesError(ArticleEntityConstants.dioException)],
    );
  });
}

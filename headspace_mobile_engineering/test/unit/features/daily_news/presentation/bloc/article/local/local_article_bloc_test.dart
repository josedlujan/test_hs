import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:headspace_mobile_engineering/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../constants/article_entity_constants.dart';
import '../../../../../../helpers/mock_helpers.mocks.dart';

void main() {
  late LocalArticlesBloc localArticlesBloc;
  final mockGetSavedArticleUseCase = MockGetSavedArticleUseCase();
  final mockSaveArticleUseCase = MockSaveArticleUseCase();
  final mockRemoveArticleUseCase = MockRemoveArticleUseCase();

  setUp(() {
    localArticlesBloc = LocalArticlesBloc(
      mockGetSavedArticleUseCase,
      mockSaveArticleUseCase,
      mockRemoveArticleUseCase,
    );

    when(mockGetSavedArticleUseCase.call()).thenAnswer(
      (_) async => ArticleEntityConstants.listOfArticleEntities,
    );
  });

  group('LocalArticlesBloc tests', () {
    blocTest(
      'emits [] when nothing is added is emitted',
      build: () => localArticlesBloc,
      expect: () => [],
    );

    blocTest(
      'emits [] when getSavedArticle event is launched',
      build: () => localArticlesBloc,
      act: (bloc) => bloc.add(const GetSavedArticles()),
      expect: () => [
        const LocalArticlesDone(
          ArticleEntityConstants.listOfArticleEntities,
        )
      ],
    );

    blocTest(
      'emits [] when savedArticles event is emitted',
      build: () => localArticlesBloc,
      act: (bloc) => bloc.add(
        const SaveArticle(
          ArticleEntityConstants.articleEntity,
        ),
      ),
      expect: () => [
        const LocalArticlesDone(
          ArticleEntityConstants.listOfArticleEntities,
        )
      ],
    );

    blocTest(
      'emits [] when removeArticle event is emitted',
      build: () => localArticlesBloc,
      act: (bloc) => bloc.add(
        RemoveArticle(
          ArticleEntityConstants.articleEntity,
        ),
      ),
      expect: () => [
        const LocalArticlesDone(
          ArticleEntityConstants.listOfArticleEntities,
        )
      ],
    );
  });
}

import 'package:headspace_mobile_engineering/features/daily_news/domain/usecases/get_article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/usecases/remove_article.dart';
import 'package:headspace_mobile_engineering/features/daily_news/domain/usecases/save_article.dart';
import 'package:mockito/annotations.dart';
@GenerateNiceMocks([MockSpec<GetSavedArticleUseCase>()])
@GenerateNiceMocks([MockSpec<SaveArticleUseCase>()])
@GenerateNiceMocks([MockSpec<RemoveArticleUseCase>()])
@GenerateNiceMocks([MockSpec<GetArticleUseCase>()])
import 'mock_helpers.mocks.dart';

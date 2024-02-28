part of 'remote_article_bloc.dart';

sealed class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {
  const GetArticles();
}

class StartCronJob extends RemoteArticlesEvent {
  const StartCronJob();
}

class StopCronJob extends RemoteArticlesEvent {
  const StopCronJob();
}

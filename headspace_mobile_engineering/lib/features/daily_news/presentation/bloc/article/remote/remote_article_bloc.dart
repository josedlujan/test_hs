import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:headspace_mobile_engineering/core/resources/data_state.dart';
import 'package:headspace_mobile_engineering/features/daily_news/presentation/constants.dart';

import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/get_article.dart';

part 'remote_article_event.dart';

part 'remote_article_state.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticlesBloc(
    this._getArticleUseCase,
  ) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
    on<StartCronJob>(startCronJob);
    on<StopCronJob>(stopCronJob);
    add(const StartCronJob());
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataSet = await _getArticleUseCase();

    if (dataSet is DataSuccess && dataSet.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataSet.data!));
    }

    if (dataSet is DataFailed) {
      emit(RemoteArticlesError(dataSet.error!));
    }
  }

  late Timer t;

  Future<void> startCronJob(
      StartCronJob event, Emitter<RemoteArticlesState> emit) async {
    t = Timer.periodic(
        const Duration(seconds: Constants.cronJobRerunTimeInSeconds),
        (Timer timer) {
      //print('Retrieving articles');
      add(const GetArticles());
    });
  }

  Future<void> stopCronJob(
      StopCronJob event, Emitter<RemoteArticlesState> emit) async {
    t.cancel();
  }
}

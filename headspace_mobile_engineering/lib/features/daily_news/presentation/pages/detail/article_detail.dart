import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/article.dart';
import '../../bloc/article/local/local_article_bloc.dart';

class ArticleDetailPage extends HookWidget {
  final ArticleEntity? article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticlesBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(
            Ionicons.chevron_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription()
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article?.title ?? "",
            style: const TextStyle(
              fontFamily: 'Buffer',
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.time_outline,
                size: 16.0,
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                article?.publishedAt ?? '',
                style: const TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250.0,
      margin: const EdgeInsets.only(top: 14.0),
      child: Image.network(
        article?.urlToImage ??
            'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
      child: Text('${article?.description ?? ''}\n\n${article?.content ?? ''}'),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFABPressed(context),
        child: const Icon(
          Ionicons.bookmark,
          color: Colors.black,
        ),
      ),
    );
  }

  _onBackButtonTapped(context) => Navigator.pop(context);

  _onFABPressed(BuildContext context) {
    BlocProvider.of<LocalArticlesBloc>(context).add(SaveArticle(article!));
  }
}
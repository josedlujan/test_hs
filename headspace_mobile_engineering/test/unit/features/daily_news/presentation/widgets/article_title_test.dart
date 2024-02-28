import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_mobile_engineering/features/daily_news/presentation/widgets/article_tile.dart';

import '../../../../constants/article_entity_constants.dart';

void main() {
  testWidgets(
      'Article Entity contains title and description , and shows error instead of image',
      (tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: ArticleWidget(
        article: ArticleEntityConstants.articleEntity,
      ),
    ));

    final titleFinder = find.text(ArticleEntityConstants.titleValue);
    final authorFinder = find.text(ArticleEntityConstants.authorValue);
    final descriptionFinder =
        find.text(ArticleEntityConstants.descriptionValue);

    final iconFinder = find.byIcon(Icons.error);
    expect(titleFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(authorFinder, findsNothing);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Golden test', (WidgetTester tester) async {
    // Compares to golden test
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: ArticleWidget(
        article: ArticleEntityConstants.articleEntity,
      ),
    ));
    await expectLater(
        find.byType(ArticleWidget), matchesGoldenFile('article_widget.png'));
  });
}

import 'dart:convert' as json;

import 'package:built_value/built_value.dart';

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  int get id;
  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

//class Article {
//  final String text;
//  final String url;
//  final String by;
//  final int time;
//  final int score;
//
//  const Article({
//    this.text,
//    this.url,
//    this.by,
//    this.time,
//    this.score,
//  });
//
//  factory Article.fromJson(Map<String, dynamic> json) {
//    if (json == null) return null;
//    return Article(
//      text: json['text'] ?? null,
//      url: json['url'],
//      score: json['score'],
//      time: json['age'],
//    );
//  }
//}

List<int> parseTopStories(String jsonStr) {
  return [];
}

Article parseArticle(String jsonStr) {
//  final parsed = json.jsonDecode(jsonStr);
//  final Article article = Article.fromJson(parsed);
//  return article;
}

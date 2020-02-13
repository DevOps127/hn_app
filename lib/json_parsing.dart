//import 'dart:convert' as json;
//
//import 'package:built_collection/built_collection.dart';
//import 'package:built_value/built_value.dart';
//import 'package:built_value/serializer.dart';
//import 'serializers.dart';
//
//part 'json_parsing.g.dart';
//
//abstract class Article implements Built<Article, ArticleBuilder> {
//  static Serializer<Article> get serializer => _$articleSerializer;
//  int get id;
//  @nullable
//  bool get deleted;
//  String get type; //"job", "story", "comment", "poll", or "pollopt".
//  String get by;
//  int get time;
//  @nullable
//  String get text;
//  @nullable
//  bool get dead;
//  @nullable
//  int get parent;
//  @nullable
//  int get poll;
//  BuiltList<int> get kids;
//  @nullable
//  String get url;
//  @nullable
//  int get score;
//  @nullable
//  String get title;
//  BuiltList<int> get parts;
//  @nullable
//  int get descendants;
//  Article._();
//  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
//}
//
////class Article {
////  final String text;
////  final String url;
////  final String by;
////  final int time;
////  final int score;
////
////  const Article({
////    this.text,
////    this.url,
////    this.by,
////    this.time,
////    this.score,
////  });
////
////  factory Article.fromJson(Map<String, dynamic> json) {
////    if (json == null) return null;
////    return Article(
////      text: json['text'] ?? null,
////      url: json['url'],
////      score: json['score'],
////      time: json['age'],
////    );
////  }
////}
//
//List<int> parseTopStories(String jsonStr) {
//  return [];
//}
//
//Article parseArticle(String jsonStr) {
//  final parsed = json.jsonDecode(jsonStr);
//  final Article article =
//      standardSerializers.deserializeWith(Article.serializer, parsed);
//  return article;
//}

import 'dart:async';
import 'dart:collection';

import 'package:hn_app/src/articles.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  HackerNewsBloc() {
    _updateArticles()
        .then((_) => _articlesSubject.add(UnmodifiableListView(_articles)));
  }

  List<int> _ids = [
    22317234,
    22315899,
    22318165,
    22307270,
    22316820,
    22316491,
    22318514,
    22315694,
    22317371,
    22317138,
    22318130,
  ]; //articles;

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));

    final articles = await Future.wait(futureArticles);

    _articles = articles;
  }

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }
}

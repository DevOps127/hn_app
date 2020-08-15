import 'dart:async';
import 'dart:collection';

import 'package:hn_app/src/articles.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

enum StoriesType {
  topStories,
  newStories,
}

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;
  final _storiesTypeController = StreamController<StoriesType>();

  var _articles = <Article>[];

  HackerNewsBloc() {
    _getArticleAndUpdate(_topIds);

    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticleAndUpdate(_newIds);
      } else {
        _getArticleAndUpdate(_topIds);
      }
    });
  }

  _getArticleAndUpdate(List<int> ids) {
    _updateArticles(ids).then(
      (_) => _articlesSubject.add(
        UnmodifiableListView(_articles),
      ),
    );
  }

  static List<int> _newIds = [
    22316491,
    22318514,
    22315694,
    22317371,
    22317138,
    22318130,
  ];

  static List<int> _topIds = [
    22317234,
    22315899,
    22318165,
    22307270,
    22316820,
  ]; //articles;

  Future<Null> _updateArticles(List<int> ids) async {
    final futureArticles = ids.map((id) => _getArticle(id));

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

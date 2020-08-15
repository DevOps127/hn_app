import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:hn_app/src/articles.dart';
import 'package:http/http.dart' as http;

void main() {
  test('parse topStories.json', () {
    const jsonString = """[
   22307270,
   22316491,
   22315694,
   22315899,
   22314831,
   22310813,
   22316379,
]
   """;
    expect(parseTopStories(jsonString).first, 22307270);
  });

  test("parse item.json", () {
    const jsonString = """{
"by": "dhouston",
   "descendants": 71,
   "id": 8863,
   "kids": [
       9224,
       8917,
       8952,
       8884,
       8887,
       8869,
       8958,
       8940,
       8908,
       9005,
       8873,
       9671,
       9067,
       9055,
       8865,
       8881,
       8872,
       8955,
       10403,
       8903,
       8928,
       9125,
       8998,
       8901,
       8902,
       8907,
       8894,
       8870,
       8878,
       8980,
       8934,
       8943,
       8876
   ],
   "score": 104,
   "time": 1175714200,
   "title": "My YC app: Dropbox - Throw away your USB drive",
   "type": "story",
   "url": "http://www.getdropbox.com/u/2/screencast.html"
}""";
    expect(parseArticle(jsonString).by, "dhouston");
  });

  test("parse item.json over a network", () async {
    final url = "https://hacker-news.firebaseio.com/v0/beststories.json";
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final idList = json.decode(res.body);
      if (idList.isNotEmpty) {
        final storyUrl =
            ' https://hacker-news.firebaseio.com/v0/item/${idList.first}.json';
        final storyRes = await http.get(storyUrl);
        if (res.statusCode == 200) {
          expect(parseArticle(storyRes.body).by, "dhouston");
        }
      }
    }
  });
}

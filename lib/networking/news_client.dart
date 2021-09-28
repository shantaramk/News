import 'dart:convert';
import 'package:http/http.dart';
import 'package:machine_test/model/news_model.dart';

class NewsClient {
  Future<List<Articles>> getNews(String urlString) async {
    Response response = await get(Uri.parse(urlString));
    dynamic news = jsonDecode(response.body);

    var articlesJson = news['articles'];

    List<Articles> articles = [];

    for (var article in articlesJson) {
      articles.add(Articles.fromJson(article));
    }
    return articles;
  }
}

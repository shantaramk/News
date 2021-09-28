
import 'package:machine_test/constant/constant.dart';

class NewsModel {
  final String status;
  final String totalResults;
  final List<Articles> articles;

  NewsModel(this.status, this.totalResults, this.articles);
}

class Articles {
  final String title;
  final String description;
  final String url;
  final String publishedAt;
  final String content;

  Articles(
    this.title, this.description, this.url, this.publishedAt, this.content);

  factory Articles.fromJson(Map<String, dynamic> json) {
    final urlToImage = json['urlToImage'] ?? kDefaultImage;
    final title = json['title'] ?? kDefualtString;
    final description = json['description'] ?? kDefualtString;
    final publishedAt = json['publishedAt'] ?? kDefualtString;
    final content = json['content'] ?? kDefualtString;
    return Articles(title, description, urlToImage, publishedAt, content);
  }
}

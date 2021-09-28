import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewsDetailWidget extends StatefulWidget {
  final article;

  NewsDetailWidget({this.article});

  @override
  _NewsDetailWidgetState createState() => _NewsDetailWidgetState();
}

class _NewsDetailWidgetState extends State<NewsDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                getImageView(),
                getPublishDateView(),
                getTitleView(),
                getDescriptionView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Private UI Method
  Widget getImageView() {
    return AspectRatio(
      aspectRatio: 3/4,
      child: Container(
        child: Image.network(
          widget.article.url,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget getTitleView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.article.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget getDescriptionView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.article.description,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget getPublishDateView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Published At: ' + ' ' + widget.article.publishedAt,
        style: TextStyle(
          color: Colors.redAccent.shade400,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

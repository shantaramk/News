import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:machine_test/model/news_model.dart';
import 'package:machine_test/networking/news_client.dart';
import 'cell/product_info_cell.dart';

class NewListWidget extends StatefulWidget {
  //Private Method

  @override
  _NewListWidgetState createState() => _NewListWidgetState();
}

class _NewListWidgetState extends State<NewListWidget> {

  //Private Method
  Future<List<Articles>> getNewsList() async {
    NewsClient newClient = NewsClient();
    List<Articles> articles = await newClient.getNews(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=91274ddd3bed48aea7974fdb4494e097');
    return articles;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('News List'),
      ),
      body: Center(
        child: FutureBuilder<List<Articles>>(
          future: getNewsList(),
          builder: (context, articleSnap) {
            if(articleSnap.connectionState == ConnectionState.waiting) {
              return getLoaderView();
            } else {
              return getListView(articleSnap.data!);
            }
          },
        ),
      ),
    );
  }

  //Private UI Method
  Widget getLoaderView() {
    return Container(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListView(List<Articles> list) {
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Articles article = list[index];
          return ProductInfoCell(article);
        },
      ),
    );
  }
}

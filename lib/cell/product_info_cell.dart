import 'package:flutter/material.dart';
import 'package:machine_test/model/news_model.dart';
import 'package:machine_test/news_detail.dart';

class ProductInfoCell extends StatelessWidget {

  final Articles article;

  ProductInfoCell(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetailWidget(article: article,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                getImageView(),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getTitleView(),
                      SizedBox(height: 8.0,),
                      getDescriptionView(),
                    ],
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            SizedBox(
              height: 10,
            ),
            getCellSeperatorView(),
          ],
        ),
      ),
    );
  }

  //Private UI Method
  Widget getImageView() {
    return Container(
      height:  100.0,
      child: Image.network(article.url,
        fit: BoxFit.cover,
        width: 100,
        height: 100,),
    );
  }

  Widget getTitleView() {
    return Text(article.title,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: 17,
      ),);
  }

  Widget getDescriptionView() {
  return Text(article.description,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 13,
    ),);
  }

  Widget getCellSeperatorView() {
    return SizedBox(
      width: double.infinity,
      height: 1,
      child: Container(
        color: Colors.grey.shade300,
      ),
    );
  }
}

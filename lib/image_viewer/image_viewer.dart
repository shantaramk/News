import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {

  final Widget sourceWidget;

  ImageViewer(this.sourceWidget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
      body: getAnimatedView(),
    );
  }

  Widget getAnimatedView() {
    return Container(
      child: Text('Hello'),
    );
  }
}



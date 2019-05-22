import 'package:flutter/material.dart';
import 'package:flutter_github/bean/MovieBean.dart';

/**
 * movie item
 */
class MovieItemWidget extends StatefulWidget {

  final Subjects subjects;
  final int index;


  MovieItemWidget({@required this.subjects, @required this.index});

  @override
  MovieItemWidgetState createState() => new MovieItemWidgetState();
}

class MovieItemWidgetState extends State<MovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text('3333')
    );
  }


  Widget getImageWidget() {
    String img = this.widget.subjects.images.large;
    return Image.network(img);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}
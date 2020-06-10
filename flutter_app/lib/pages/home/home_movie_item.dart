import 'package:flutter/material.dart';
import '../model/home_model.dart';
import 'dash_line.dart';
import 'star_rating.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;
  HYHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 8,color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          buildContent(),
          buildFooter()
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 9, 36)),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      children: [
        buildContentImage(),
        buildContentInfo(),
        buildContentLine(),
        buildContentWish()
      ],
    );
  }

//  内容的图片
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie.imageURL,
        height: 150,
      ),
    );
  }

  Widget buildContentInfo() {
    return Column(
      children: [
        buildContentInfoTitle(),
        buildContentInfoRate(),
        buildContentInfoDesc()
      ],
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(),
          WidgetSpan(),
          WidgetSpan()
        ]
      )
    );
  }

  Widget buildContentInfoRate() {
    return Container();
  }

  Widget buildContentInfoDesc() {
    return Container();
  }

  Widget buildContentLine() {
    return Container();
  }

  Widget buildContentWish() {
    return Container();
  }

  Widget buildFooter() {
    return Text("footer");
  }

}

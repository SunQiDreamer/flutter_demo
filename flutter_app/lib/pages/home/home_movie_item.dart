
import 'package:flutter/material.dart';
import '../model/home_model.dart';
import 'dash_line.dart';
import 'star_rating.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  HYHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

//头部的布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                buildContentInfo(),
                SizedBox(
                  width: 8,
                ),
                buildContentLine(),
                SizedBox(
                  width: 8,
                ),
                buildContentWish()
              ],
            ),
          ),
        ),
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

//  内容的信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(""),
        ],
      ),
    );
  }

//  内容的虚线
  Widget buildContentLine() {
    return Container(
      child: HYDashLine(
        axis: Axis.vertical,
        dashWidth: .4,
        dashHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

//  内容的想看
  Widget buildContentWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png"),
          Text(
              "想看",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 235, 170, 60)
            ),
          ),
        ],
      ),
    );
  }

//  尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }
}

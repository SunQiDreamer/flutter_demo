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
    return Expanded(
      child: Column(
        children: [
          buildContentInfoTitle(),
          buildContentInfoRate(),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.pink,
              size: 40,
            ),
            baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle
          ),
          TextSpan(
            text: movie.title
          ),
          WidgetSpan(
            child: Text("(${movie.playDate})"),
            style: TextStyle(fontSize: 18, color: Colors.grey),
            alignment: PlaceholderAlignment.bottom
          )
        ]
      )
    );
  }

  Widget buildContentInfoRate() {
    return Row(
      children: [
        HYStarRating(
          rating: movie.rating,
          size: 20,
        ),
        Text("${movie.rating}", style: TextStyle(fontSize: 16),)
      ],
    );
  }

  Widget buildContentInfoDesc() {

    final genresString = movie.genres.join(" ");
    final directorString = movie.director.name;
    List<Actor> casts = movie.casts;
    final actorString = movie.casts.map((e) => e.name).join(" ");

    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

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

  Widget buildContentWish() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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

  Widget buildFooter() {
    return Container(
      width: double.infinity, // 占满整个屏幕
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xff666666)),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import '../model/home_model.dart';
import '../../request/home_request.dart';
import 'home_movie_item.dart';


class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {

  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    // Add code after super

    HomeRequest.requestMovieList(0).then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return HYHomeMovieItem(
        movies[index]
      );
    },
      itemCount: movies.length,
    );
  }
}


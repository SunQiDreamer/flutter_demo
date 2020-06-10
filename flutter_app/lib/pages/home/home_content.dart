import 'package:flutter/material.dart';
import '../model/home_model.dart';
import '../../request/home_request.dart';

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

        HomeRequest.rquestMovieList(0).then((res) {
          setState(() {
            movies.addAll(res);
          });
        });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return Container();
      }
    );
  }
}

import '../pages/model/home_model.dart';
import 'config.dart';
import 'http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> rquestMovieList(int start) async {
    final movieURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";

    final result = await HttpRequest.request(movieURL);
    final subjects = result['subject'];

    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    return movies;

  }
}
import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
    String method = "get",
    Map<String, dynamic> params,
    Interceptor inter}) async {

    final options = Options(method: method);
    Interceptor dInter = InterceptorsWrapper(onRequest: (options) {
      return options;
    }, onResponse: (response) {
      return response;
    }, onError: (err) {
      return err;
    });

    List<Interceptor> inters = [dInter];

    if (inter != null) {
      inters.add(inter);
    }

    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}

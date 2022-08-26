import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod({required String url}) async {
    return await Dio().get(url);
  }
}

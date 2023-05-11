import 'package:dio/dio.dart';

class ApiGlobal {
  final dio = Dio();
//GET

  Future<dynamic> getHttp(String baseUrl, Map<String, dynamic> queryParemeters) async {
    final response = await dio.get(baseUrl, queryParameters: queryParemeters).timeout(const Duration(seconds: 10));

    if (response.data['data']['valid'] == true) {
      return true;
    }

    if (response.data['data']['valid'] == false) {
      return false;
    }
  }
}

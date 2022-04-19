import 'package:dio/dio.dart';

import '../constant/api_url.dart';

class AuthAPi {
  Dio apiNormal() {
    BaseOptions dioOption = BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        responseType: ResponseType.json,
        headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"});
    final dio = Dio(dioOption);
    return dio;
  }

  _getRequest({required String endpoint, param}) async {
    try {
      final dio = apiNormal();
      final res = await dio.get(endpoint, queryParameters: param);
      return res.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print("timeout");
      }
    } catch (e) {
      print("error");
    }
  }

  _postRequest({required String endpoint, body}) async {
    try {
      final dio = apiNormal();
      final res = await dio.post(endpoint, data: body);
      return res.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print("timeout");
      }
    } catch (e) {
      print("error");
    }
  }

  // Future<Map<String, dynamic>?> getUserbyEmail(email) {
  getUserbyEmail(email) {
    final result = _getRequest(endpoint: ApiUrl.users, param: {"email": email});
    return result;
  }

  postRegisterUser(body) async {
    final result = _postRequest(endpoint: ApiUrl.users, body: body);
    return result;
  }

  Future<Map<String, dynamic>?> getLatihanSoal(email) async {
    final result = _getRequest(endpoint: ApiUrl.users, param: {"email": email});
    return result;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../constant/api_url.dart';

class BannerApi {
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

  getBanner({limit}) {
    final result = _getRequest(endpoint: ApiUrl.banner, param: {
      "limit": limit,
    });
    return result;
  }
}

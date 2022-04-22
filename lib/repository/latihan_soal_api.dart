import 'package:dio/dio.dart';

import '../constant/api_url.dart';

class LatihanSoalApi {
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

  getMataPelajaran(email, major) {
    final result = _getRequest(
        endpoint: ApiUrl.mataPelajaran,
        param: {"major_name": major, "user_email": email});
    return result;
  }

  getMateri(email, courseId) {
    final result = _getRequest(
        endpoint: ApiUrl.materi,
        param: {"course_id": courseId, "user_email": email});
    return result;
  }

  getSubMateri(email, courseContentId) {
    final result = _getRequest(
        endpoint: ApiUrl.subMateri,
        param: {"course_content_id": courseContentId, "user_email": email});
    return result;
  }

  getPaketLatihanSoalList(email, courseId) {
    final result = _getRequest(
        endpoint: ApiUrl.paketLatsolList,
        param: {"course_id": courseId, "user_email": email});
    return result;
  }

  postKerjakan(email, exerciseId) {
    final result = _postRequest(
        endpoint: ApiUrl.latSoal,
        body: {"exercise_id": exerciseId, "user_email": email});
    return result;
  }

  postInputJawaban(payload) {
    final result = _postRequest(endpoint: ApiUrl.inputJawaban, body: payload);
    return result;
  }
}

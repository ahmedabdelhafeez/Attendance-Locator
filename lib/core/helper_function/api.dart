import 'package:attendance_and_departure/features/auth/presentation/provider/auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';
import 'convert.dart';

class ApiHandle {
  static ApiHandle? _instance;
  late Dio dio;
  ApiHandle._();
  String? lang;
  late CancelToken cancelToken;
  static ApiHandle get getInstance {
    _instance ??= ApiHandle._(); // Instantiate if null
    return _instance!;
  }

  Future<void> init() async {
    var prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language_code');
    if (language != null) {
      lang = language;
    }
    dio = Dio(BaseOptions(
      baseUrl: Constants.baseUri,
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    /* await Future.wait([
      for(var i in LanguageProvider.languages)
        Dio().get('${Constants.baseUri}app_language/user/${i.languageCode}.json'),
    ]).then((value) {
      Map data = {};
      for(int i = 0;i<LanguageProvider.languages.length;i++){
        data[LanguageProvider.languages[i].languageCode] = value[i].data;
      }
      languages = data;
      print('hamza finish');
    } */
  }

  Map languages = {};
  void cancelFunction() async {
    cancelToken.cancel();
  }

  void updateHeader(String token, {String? language}) async{
    if (language != null) {
      lang = language;
    }
    dio.options = await BaseOptions(
      baseUrl: Constants.baseUri,
      headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
    );
  }

  Future<Either<DioException, Response>> get(path, [Map<String, dynamic>? data]) async {
    try {
      await reLogin(path);
      cancelToken = CancelToken();
      Response response = await dio.get(path, queryParameters: data, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        return Right(response);
      }
      return Left(dioException(response));
    } on DioException catch (e) {
      print(e.toString());
      print(e.message);
      return Left(e);
    } catch (e) {
      print(e.toString());
      return Left(
        DioException(requestOptions: RequestOptions(baseUrl: Constants.baseUri, path: path), message: 'Server Error'),
      );
    }
  }

  Future<Either<DioException, Response>> post(path, Map<String, dynamic> data) async {
    print(path);
    print(data);
    try {
      await reLogin(path);

      cancelToken = CancelToken();
      Response response = await dio.post(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200) {
        return Right(response);
      }
      return Left(dioException(response));
    } on DioException catch (e) {
      debugPrint(e.message);
      print("dioException ON $path");
      return Left(e);
    } catch (e) {
      debugPrint(e.toString());

      print("dioException Catch $path");
      return Left(
        DioException(requestOptions: RequestOptions(baseUrl: Constants.baseUri, path: path), message: 'Server Error'),
      );
    }
  }

  Future<Either<DioException, Response>> delete(path) async {
    print(path);
    try {
      Response response = await dio.delete(
        path,
      );
      if (response.statusCode == 204) {
        return Right(response);
      }
      return Left(dioException(response));
    } on DioException catch (e) {
      debugPrint(e.toString());
      debugPrint(e.message);
      print("dioException ON $path");
      return Left(e);
    } catch (e) {
      debugPrint(e.toString());

      print("dioException Catch $path");
      return Left(
        DioException(requestOptions: RequestOptions(baseUrl: Constants.baseUri, path: path), message: 'Server Error'),
      );
    }
  }
   Future<Either<DioException, Response>> update(path,Map<String, dynamic> data) async {
    print(path);
    try {
      Response response = await dio.put(
        path,
        data:data 
      );
      if (response.statusCode == 204) {
        return Right(response);
      }
      return Left(dioException(response));
    } on DioException catch (e) {
      debugPrint(e.toString());
      debugPrint(e.message);
      print("dioException ON $path");
      return Left(e);
    } catch (e) {
      debugPrint(e.toString());

      print("dioException Catch $path");
      return Left(
        DioException(requestOptions: RequestOptions(baseUrl: Constants.baseUri, path: path), message: 'Server Error'),
      );
    }
  }

  DioException dioException(Response response) {
    String msg = 'Server Error';
    if (response.data is Map) {
      Map data = response.data;
      if (data['message'] is Map) {
        msg = convertMapToString(data['message']);
      } else if (data['message'] is List) {
        msg = data['message'].join('\n');
      } else {
        msg = data['message'];
      }
    }
    return DioException(
      requestOptions: response.requestOptions,
      message: msg,
      type: msg == 'Server Error' ? DioExceptionType.unknown : DioExceptionType.badResponse,
      response: response,
      error: 'Server Error',
    );
  }

  Future reLogin(String url) async {
    print(url);
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    if (AuthProvider.isLogin() &&
        authProvider.userEntity != null &&
        (DateTime.now().difference(authProvider.lastLogin).inMinutes > 58) &&
        url != 'user/login') {
    //  await authProvider.loginButton(fromSplash: true, fromJWT: true);
    }
  }
}

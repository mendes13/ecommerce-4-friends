import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  final BaseOptions options = BaseOptions(
    baseUrl: 'http://localhost:4000/api',
    connectTimeout: 1000,
  );

  CustomDio([BaseOptions options]) : super(options);
}

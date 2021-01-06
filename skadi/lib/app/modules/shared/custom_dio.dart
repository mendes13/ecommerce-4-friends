import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  final BaseOptions options =
      BaseOptions(baseUrl: 'http://192.168.1.110:4000/api');

  CustomDio([BaseOptions options]) : super(options);
}

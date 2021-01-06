import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:skadi/app/modules/shared/constants.dart';

class CustomDio extends DioForNative {
  final BaseOptions options = BaseOptions(baseUrl: '$BASE_URL/api');

  CustomDio([BaseOptions options]) : super(options);
}

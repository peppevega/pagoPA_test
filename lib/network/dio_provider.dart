import 'package:dio/dio.dart';

Dio provideDio(String host,
    {List<Interceptor> interceptors = const <Interceptor>[]}) {
  final BaseOptions options = BaseOptions(
    baseUrl: host,
    headers: <String, dynamic>{
      'accept': Headers.jsonContentType,
    },
    contentType: Headers.jsonContentType,
    connectTimeout: 120000,
    receiveTimeout: 120000,
  );

  final Dio dio = Dio(options);
  if (interceptors.isNotEmpty) {
    for (int i = 0; i < interceptors.length; i++) {
      final Interceptor interceptor = interceptors[i];
      dio.interceptors.add(interceptor);
    }
  }

  return dio;
}

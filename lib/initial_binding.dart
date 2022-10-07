import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pagopa_test/network/dio_provider.dart';

class InitialBinding extends Bindings {
  final String host;
  InitialBinding(
    this.host,
  );

  @override
  void dependencies() async {
    final Dio dio = provideDio(host);

    Get.put(dio);
  }
}

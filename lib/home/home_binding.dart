import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pagopa_test/home/home_controller.dart';
import 'package:pagopa_test/network/item_network.dart';
import 'package:pagopa_test/network/item_network_impl.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    final Dio dio = Get.find();
    ItemNetwork itemNetwork = ItemNetworkImpl(dio);

    Get.lazyPut(
      () => HomeController(itemNetwork),
    );
  }
}

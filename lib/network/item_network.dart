import 'package:dio/dio.dart';
import 'package:pagopa_test/models/item_response_model.dart';

abstract class ItemNetwork {
  ItemNetwork(Dio dio) : super();
  Future<List<ItemResponseModel>> getItems();
}

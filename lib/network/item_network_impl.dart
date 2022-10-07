import 'package:dio/dio.dart';
import 'package:pagopa_test/models/item_response_model.dart';
import 'package:pagopa_test/network/item_network.dart';

class ItemNetworkImpl extends ItemNetwork {
  final Dio _dio;

  ItemNetworkImpl(this._dio) : super(_dio);

  //API call to fetch data

  @override
  Future<List<ItemResponseModel>> getItems() async {
    List<ItemResponseModel> model;
    final Response<dynamic> response = await _dio.get(
      "services/v5/projects/2116794/stories",
    );
    model = List<ItemResponseModel>.from(response.data
        .map<ItemResponseModel>((dynamic i) => ItemResponseModel.fromJson(i)));

    return model;
  }
}

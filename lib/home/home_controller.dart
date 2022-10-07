import 'dart:async';

import 'package:get/get.dart';
import 'package:pagopa_test/models/item_response_model.dart';
import 'package:pagopa_test/network/item_network.dart';

class HomeController extends GetxController {
  final ItemNetwork _itemNetwork;
  List<ItemResponseModel> listItems = <ItemResponseModel>[];
  StreamController<List<ItemResponseModel>> listItemsController =
      StreamController<List<ItemResponseModel>>.broadcast();
  StreamController<bool> isLoading = StreamController<bool>.broadcast();
  RxString sortingKey = RxString('');
  List<String> keyList = [
    "Id",
    "Current state",
    "Created at",
    "Updated at",
    "Accepted at",
    "Project id",
    "Owned by id",
  ];
  List<String> sortingOrder = ["Ascending", "Descending"];

  HomeController(this._itemNetwork);

  //fetch data on startup
  @override
  void onInit() async {
    sortingKey.value = keyList.first;
    isLoading.sink.add(true);
    listItems = await _itemNetwork.getItems();
    listItems.sort((a, b) => a.id.compareTo(b.id));
    listItemsController.sink.add(listItems);
    isLoading.sink.add(false);
    super.onInit();
  }

  //sort items by chosen key
  void sortItems() {
    switch (sortingKey.value) {
      case 'Id':
        listItems.sort((a, b) => a.id.compareTo(b.id));
        listItemsController.sink.add(listItems);
        break;
      case 'Current state':
        listItems.sort((a, b) => a.currentState!.compareTo(b.currentState!));
        listItemsController.sink.add(listItems);
        break;
      case 'Created at':
        listItems.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        listItemsController.sink.add(listItems);
        break;
      case 'Updated at':
        listItems.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        listItemsController.sink.add(listItems);
        break;
      case 'Project id':
        listItems.sort((a, b) => a.projectId!.compareTo(b.projectId!));
        listItemsController.sink.add(listItems);
        break;
      case 'Owned by id':
        listItems.sort(
            (a, b) => a.ownedById.toString().compareTo(b.ownedById.toString()));
        listItemsController.sink.add(listItems);
        break;
    }
    Get.back();
  }

  //reverse list order
  void sortAscendingOrDescending() {
    listItems = listItems.reversed.toList();
    listItemsController.sink.add(listItems);
  }
}

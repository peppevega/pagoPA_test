import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pagopa_test/home/home_controller.dart';
import 'package:pagopa_test/home/home_ext.dart';
import 'package:pagopa_test/models/item_response_model.dart';
import 'package:pagopa_test/models/label.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: const Text("Items list"),
        actions: [
          IconButton(
              onPressed: () => controller.sortAscendingOrDescending(),
              icon: const Icon(Icons.swap_vert)),
          IconButton(
              onPressed: () => _openSortDialog(context),
              icon: const Icon(Icons.sort)),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<ItemResponseModel>>(
            stream: controller.listItemsController.stream,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  //spinner to show while loading data
                  StreamBuilder<bool>(
                      stream: controller.isLoading.stream,
                      builder: (context, loaderSnapshot) {
                        return Visibility(
                            visible: loaderSnapshot.data == true ? true : false,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: Color.fromRGBO(0, 114, 213, 0),
                            )));
                      }),
                  // if data are ready, show them in the UI
                  snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(
                            bottom: kBottomNavigationBarHeight,
                          ),
                          itemCount: controller.listItems.length,
                          itemBuilder: (_, int i) {
                            final ItemResponseModel item =
                                controller.listItems[i];
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                iconColor: Colors.black,
                                collapsedIconColor: Colors.black,
                                tilePadding: const EdgeInsets.only(
                                  left: 0,
                                ),
                                title: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text("Item id ${item.id}")),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3.0, bottom: 3.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        "Kind",
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        item.kind ?? '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        "Story type",
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        item.storyType ?? '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        "Story priority",
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        item.storyPriority ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        dateItemDetail(
                                            "Created at",
                                            item.createdAt != null
                                                ? DateFormat(
                                                        "dd-MM-yyyy HH:mm:ss")
                                                    .format(item.createdAt!)
                                                : ''),
                                        dateItemDetail(
                                            "Updated at",
                                            item.updatedAt != null
                                                ? DateFormat(
                                                        "dd-MM-yyyy HH:mm:ss")
                                                    .format(item.updatedAt!)
                                                : ''),
                                        dateItemDetail(
                                            "Accepted at",
                                            item.acceptedAt != null
                                                ? DateFormat(
                                                        "dd-MM-yyyy HH:mm:ss")
                                                    .format(item.acceptedAt!)
                                                : ''),
                                        textItemDetail("Name", item.name ?? ''),
                                        textItemDetail("Description",
                                            item.description ?? ''),
                                        textItemDetail("Current state",
                                            item.currentState ?? ''),
                                        textItemDetail("Requested by id",
                                            item.requestedById.toString()),
                                        textItemDetail("Url", item.url ?? ''),
                                        textItemDetail("Project id",
                                            item.projectId.toString()),
                                        textItemDetail("Owned by id",
                                            item.ownedById.toString()),
                                        if (item.labels != null)
                                          for (Label label in item.labels!)
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.0),
                                                  child: Text(
                                                    "Labels",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.info,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () =>
                                                      _showLabelDetails(
                                                          context, label),
                                                ),
                                              ],
                                            ),
                                        if (item.ownerIds != null)
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.0),
                                                child: Text(
                                                  "Owner Ids",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.info,
                                                  color: Colors.grey,
                                                ),
                                                onPressed: () =>
                                                    _showOwnerIdsDetails(
                                                        context,
                                                        item.ownerIds!),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(),
                ],
              );
            }),
      ),
    );
  }

  // modal widget to show label details, if any
  void _showLabelDetails(BuildContext context, Label label) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Label"),
            content: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: Column(
                        children: [
                          textItemDetail("Id ", label.id.toString()),
                          textItemDetail(
                              "Project id ", label.projectId.toString()),
                          textItemDetail("Kind ", label.kind.toString()),
                          textItemDetail("Name ", label.name.toString()),
                          textItemDetail(
                              "Created at ",
                              DateFormat("dd-MM-yyyy HH:mm:ss")
                                  .format(label.createdAt!)),
                          textItemDetail(
                              "Updated at",
                              DateFormat("dd-MM-yyyy HH:mm:ss")
                                  .format(label.updatedAt!))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Get.back(), child: const Text("CLOSE"))
            ],
          );
        });
  }

  // modal widget to owner ids details, if any
  void _showOwnerIdsDetails(BuildContext context, List<dynamic> ownerIds) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Owner Ids"),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Column(
                children: [
                  for (num ownerId in ownerIds) Text(ownerId.toString())
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text("CLOSE"))
          ],
        );
      },
    );
  }

  // modal widget to sort items
  void _openSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Sort by"),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Column(
                children: <Widget>[
                  Obx(
                    () => DropdownButton<String>(
                        value: controller.sortingKey.value,
                        items: controller.keyList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) =>
                            {controller.sortingKey.value = value!}),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Get.back(), child: const Text("CANCEL")),
            TextButton(
                onPressed: () => {controller.sortItems(), Get.back()},
                child: const Text("SORT"))
          ],
        );
      },
    );
  }
}

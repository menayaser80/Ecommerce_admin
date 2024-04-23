import 'package:admin_app/controller/Items/view_controller.dart';
import 'package:admin_app/core/class/handling_data.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/linkApi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Itemsview extends StatelessWidget {
  const Itemsview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Items'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.itemsadd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<ItemsController>(
          builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: WillPopScope(
                  onWillPop: () {
                    return controller.myback();
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: CachedNetworkImage(
                                          height: 80,
                                          imageUrl:
                                          "${AppLink.imagestItems}/${controller.data[index].itemsImage}"),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: ListTile(
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: "Warning",
                                                middleText: "Are you sure to delete this item?",
                                                onConfirm: (){
                                                  controller.deleteItem(
                                                      controller
                                                          .data[index].itemsId!,
                                                      controller.data[index]
                                                          .itemsImage!);
                                                  Get.back();
                                                },
                                                onCancel: (){},
                                              );

                                            },
                                            icon: Icon(Icons.delete_outline),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                         controller.gotopageEdit(controller.data[index]);

                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(controller
                                          .data[index].categoriesName!),
                                      title: Text(controller
                                          .data[index].itemsName!),
                                    )),
                              ],
                            ),
                          );
                        },
                        itemCount: controller.data.length,
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }
}

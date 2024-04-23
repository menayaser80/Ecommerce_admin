import 'package:admin_app/controller/category/view_controller.dart';
import 'package:admin_app/core/class/handling_data.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/linkApi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categortview extends StatelessWidget {
  const Categortview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategiryController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.categoryadd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<CategiryController>(
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
                                      child: SvgPicture.network(
                                          height: 80,
                                          "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}"),
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
                                                middleText: "Are you sure to delete this Category?",
                                                onConfirm: (){
                                                  controller.deleteCat(
                                                      controller
                                                          .data[index].categoriesId!,
                                                      controller.data[index]
                                                          .categoriesImage!);
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
                                          .data[index].categoriesDatetime!),
                                      title: Text(controller
                                          .data[index].categoriesName!),
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

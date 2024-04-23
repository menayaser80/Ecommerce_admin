import 'package:admin_app/controller/Items/add_controller.dart';

import 'package:admin_app/core/class/handling_data.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custombutton.dart';
import 'package:admin_app/core/shared/customdropdownsearch.dart';
import 'package:admin_app/core/shared/customtextformfield.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Itemsaddpage extends StatelessWidget {
  const Itemsaddpage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());

    return Scaffold(
        appBar: AppBar(
          title: Text(' Add Items'),
        ),
        body: GetBuilder<ItemsAddController>(
            builder: (controller) =>
                HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hinttext: "Item Name",
                              labeltext: "Item Name",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Item Name (Arabic)",
                              labeltext: "Item Name (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Description Name",
                              labeltext: "Description Name",
                              iconData: Icons.category,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Description Name (Arabic)",
                              labeltext: "Description Name (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "count",
                              labeltext: "count",
                              iconData: Icons.category,
                              mycontroller: controller.count,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: "Price",
                              labeltext: "Price",
                              iconData: Icons.category,
                              mycontroller: controller.price,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: "Discount",
                              labeltext: "Discount",
                              iconData: Icons.category,
                              mycontroller: controller.discount,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          Customdropdownsearch(
                            title: "Choose category",
                              listdata:controller.dropdownlist,
                              dropdownname:controller.catname! ,
                              dropdownid:controller.catid!
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              onPressed: () {
                                controller.showOptionmenu();
                              },
                              child: Text("Choose Image"),
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                            ),
                          ),

                          if (controller.file != null)
                            Image.file(
                              controller.file!,
                              height: 90,
                              width: 90,
                            ),
                          CustomButton(
                            text: "Add Item",
                            onPressed: () {
                              controller.addData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

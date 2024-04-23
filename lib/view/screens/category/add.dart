import 'package:admin_app/controller/category/add_controller.dart';
import 'package:admin_app/core/class/handling_data.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/Upload%20Image.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custombutton.dart';
import 'package:admin_app/core/shared/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Catedoryadd extends StatelessWidget {
  const Catedoryadd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryAddController controller = Get.put(CategoryAddController());

    return Scaffold(
        appBar: AppBar(
          title: Text(' Add Category'),
        ),
        body: GetBuilder<CategoryAddController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hinttext: "Category Name",
                              labeltext: "Category Name",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Category Name (Arabic)",
                              labeltext: "Category Name (Arabic)",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              onPressed: () {
                                controller.chooseImage();
                              },
                              child: Text("Choose Image"),
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                            ),
                          ),
                          if (controller.file != null)
                            SvgPicture.file(
                              controller.file!,
                              height: 90,
                              width: 90,
                            ),
                          CustomButton(
                            text: "Add Category",
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

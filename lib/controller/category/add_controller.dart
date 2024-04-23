import 'dart:io';

import 'package:admin_app/controller/category/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/Upload%20Image.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/remote/Category_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  File? file;
chooseImage()async{
  file=await imageUploadGallery(true);
update();
}
   StatusRequest? statusRequest=StatusRequest.none;

  addData() async {
    if(formstate.currentState!.validate())
      {
        if(file == null)
        {
          Get.snackbar("Warning","Please Choose Image Svg");
        }
        statusRequest = StatusRequest.loading;
        update();

        Map data = {
          "name": name.text,
          "namear": namear.text,
        };
        var response = await categoriesData.addData(data, file!);
        print("=============================== Controller $response ");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.categoryview);
         CategiryController c= Get.find();
         c.getData();
          } else {
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      }

  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}

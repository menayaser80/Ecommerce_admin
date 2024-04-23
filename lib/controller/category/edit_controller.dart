import 'dart:io';

import 'package:admin_app/controller/category/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/Upload%20Image.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/remote/Category_data.dart';
import 'package:admin_app/data/model/categorymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late TextEditingController name;
  CategoriesModel?categoriesModel;
  late TextEditingController namear;
  File? file;
  chooseImage()async{
    file=await imageUploadGallery(true);
    update();
  }
  StatusRequest? statusRequest=StatusRequest.none;

  editData() async {
    if(formstate.currentState!.validate())
    {
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold":categoriesModel!.categoriesImage!,
        "id":categoriesModel!.categoriesId.toString()
      };
      var response = await categoriesData.editData(data, file);
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
    categoriesModel=Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text=categoriesModel!.categoriesName!;
    namear.text=categoriesModel!.categoriesNamaAr!;
    super.onInit();
  }
}

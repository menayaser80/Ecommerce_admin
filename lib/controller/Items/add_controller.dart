import 'dart:io';

import 'package:admin_app/controller/Items/view_controller.dart';
import 'package:admin_app/controller/category/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/Upload%20Image.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/remote/Category_data.dart';
import 'package:admin_app/data/datasource/remote/Items_data.dart';
import 'package:admin_app/data/model/categorymodel.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  List<SelectedListItem> dropdownlist = [];
  late TextEditingController discount;
  TextEditingController? catid;
  TextEditingController? catname;

  File? file;

  showOptionmenu() {
    showbottommenu(chooseImagecamera, chooseImagegallery);
  }

  chooseImagecamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImagegallery() async {
    file = await imageUploadGallery(false);
    update();
  }

  StatusRequest? statusRequest = StatusRequest.none;

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Warning", "Please Choose Image ");
      }
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };
      var response = await itemsData.addData(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  getcat() async {
    CategoriesData categoriesData = CategoriesData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId!));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  showdropdown(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"), SelectedListItem(name: "b")],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
          // showSnackBar(list.toString());
        },
      ),
    ).showModal(context);
  }

  @override
  void onInit() {
    getcat();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    super.onInit();
  }
}

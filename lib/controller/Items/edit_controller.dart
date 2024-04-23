import 'dart:io';

import 'package:admin_app/controller/Items/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/Upload%20Image.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/remote/Items_data.dart';
import 'package:admin_app/data/model/items%20model.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
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
  String? active;

  changestatusActive(val) {
    active = val;
    update();
  }

  ItemsModel? itemsModel;
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
  chooseImage() async {
    file = await imageUploadGallery(true);
    update();
  }

  StatusRequest? statusRequest = StatusRequest.none;

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId,
        "imageold": itemsModel!.itemsImage,
        "name": name.text,
        "namear": namear.text,
        "active":active,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };
      var response = await itemsData.editData(data, file);
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

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
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
    catid!.text = itemsModel!.categoriesId.toString();
    catname!.text = itemsModel!.categoriesName;
    name.text = itemsModel!.itemsName;
    namear.text = itemsModel!.itemsNameAr;
    desc.text = itemsModel!.itemsDesc;
    descar.text = itemsModel!.itemsDescAr;
    price.text = itemsModel!.itemsPrice.toString();
    discount.text = itemsModel!.itemsDiscount.toString();
    count.text = itemsModel!.itemsCount.toString();
    active = itemsModel!.itemsActive.toString();
    super.onInit();
  }
}

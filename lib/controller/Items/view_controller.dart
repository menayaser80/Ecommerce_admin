import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/remote/Category_data.dart';
import 'package:admin_app/data/datasource/remote/Items_data.dart';
import 'package:admin_app/data/datasource/remote/Items_data.dart';
import 'package:admin_app/data/model/categorymodel.dart';
import 'package:admin_app/data/model/items%20model.dart';
import 'package:admin_app/data/model/items%20model.dart';
import 'package:admin_app/data/model/items%20model.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItem(String id, String imagename) {
    itemsData.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId==id);
    update();
  }
  gotopageEdit(ItemsModel itemsModel)
  {
    Get.toNamed(AppRoute.itemsedit,arguments: {
      "itemsModel":itemsModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
}

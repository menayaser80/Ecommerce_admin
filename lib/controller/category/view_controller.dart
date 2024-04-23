import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/remote/Category_data.dart';
import 'package:admin_app/data/model/categorymodel.dart';
import 'package:get/get.dart';

class CategiryController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCat(String id, String imagename) {
    categoriesData.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId==id);
    update();
  }
  gotopageEdit(CategoriesModel categoriesModel)
  {
    Get.toNamed(AppRoute.categoryedit,arguments: {
      "categoriesModel":categoriesModel
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

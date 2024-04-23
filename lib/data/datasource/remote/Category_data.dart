import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linkApi.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.categoryview, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.categoryadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.categoryedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoryedit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.categorydelete, data);
    return response.fold((l) => l, (r) => r);
  }
}

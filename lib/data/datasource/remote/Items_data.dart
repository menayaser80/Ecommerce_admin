import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkApi.dart';


class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewitems, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.additems, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.edititems, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.edititems, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.deleteitems, data);
    return response.fold((l) => l, (r) => r);
  }
}

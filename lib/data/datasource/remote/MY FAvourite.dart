


import '../../../core/class/crud.dart';
import '../../../linkApi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deletefromfavourite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}


import '../../../core/class/crud.dart';
import '../../../linkApi.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);
  getData(String id,String userid) async {
    var response = await crud.postData(AppLink.items, {"id" : id.toString(),
    "users_id":userid});
    return response.fold((l) => l, (r) => r);
  }
}
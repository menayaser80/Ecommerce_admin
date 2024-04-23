

import '../../../../core/class/crud.dart';
import '../../../../linkApi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.ordersarchive, {});
    return response.fold((l) => l, (r) => r);
  }
}
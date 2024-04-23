

import '../../../../core/class/crud.dart';
import '../../../../linkApi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.orderviewaccepted, {});
    return response.fold((l) => l, (r) => r);
  }
  doneprepare(String ordersid,String userid,String ordertype) async {
    var response = await crud.postData(AppLink.orderprepare, {"ordersid": ordersid,"usersid":userid,"ordertype":ordertype});
    return response.fold((l) => l, (r) => r);
  }
}
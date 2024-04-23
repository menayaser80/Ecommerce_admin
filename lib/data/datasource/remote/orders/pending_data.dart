



import '../../../../core/class/crud.dart';
import '../../../../linkApi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.orderviewpending, {});
    return response.fold((l) => l, (r) => r);
  }
  approveOrder(String userid, String orderid) async {
    var response = await crud.postData(AppLink.ordersapprove, {
      "usersid": userid,
      "ordersid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}

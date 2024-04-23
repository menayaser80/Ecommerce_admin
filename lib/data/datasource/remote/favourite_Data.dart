


import '../../../core/class/crud.dart';
import '../../../linkApi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteAdd, {"users_id": usersid, "items_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"users_id": usersid, "items_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
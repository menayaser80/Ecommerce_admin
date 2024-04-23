
import 'package:admin_app/view/screens/orders/accepted.dart';
import 'package:admin_app/view/screens/orders/archive.dart';
import 'package:admin_app/view/screens/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class orderScreenController extends GetxController {
  changePage(int currentpage);
}

class orderScreenControllerImp extends orderScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    OrdersAccepted(),
    OrdersArchiveView(),

    // NotificationView(),
    // OfferScreen(),
    // Settang(),
  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined} ,
    {"title": "Archive", "icon": Icons.archive_outlined} ,


  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
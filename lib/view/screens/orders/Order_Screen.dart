
import 'dart:io';



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/OrderScreenController.dart';
import '../../widgets/Home/custombottomappbarhome.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(orderScreenControllerImp());
    return GetBuilder<orderScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text("Orders"),
          ),
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body:controller.listPage.elementAt(controller.currentpage),
        ));
  }
}
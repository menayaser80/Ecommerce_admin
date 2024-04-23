

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/OrderScreenController.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<orderScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length , ((index) {
                  return Expanded(
                        child: CustomButtonAppBar(
                        textbutton: controller.bottomappbar[index]['title'],
                        icondata: controller.bottomappbar[index]['icon'],
                        onPressed: () {
                          controller.changePage(index);
                        },
                        active: controller.currentpage == index ? true : false),
                      );
                }))
              ],
            )));
  }
}
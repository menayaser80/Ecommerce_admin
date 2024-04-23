import 'package:admin_app/core/constant/imgaeasset.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/view/widgets/Home/card%20Admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homecontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin App'),
      ),
      body: ListView(
        children: [
          GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 150,
          ),
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdmin(
                title:'Categories' ,
                 url:AppImageAsset.category ,
                onclick:(){
                  Get.toNamed(AppRoute.categoryview);
                } ,
              ),
              CardAdmin(
                title:'Items' ,
                url:AppImageAsset.items ,
                onclick:(){
                  Get.toNamed(AppRoute.itemsview);

                } ,
              ),
              CardAdmin(
                title:'orders' ,
                url:AppImageAsset.orders ,
                onclick:(){
                  Get.toNamed(AppRoute.orderscreen);

                } ,
              ),

            ],
          )
        ],
      ),
    );
  }
}


import 'package:admin_app/view/screens/Home.dart';
import 'package:admin_app/view/screens/category/VIEW.dart';
import 'package:admin_app/view/screens/category/add.dart';
import 'package:admin_app/view/screens/category/edit.dart';
import 'package:admin_app/view/screens/Items/VIEW.dart';
import 'package:admin_app/view/screens/Items/add.dart';
import 'package:admin_app/view/screens/Items/edit.dart';
import 'package:admin_app/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:admin_app/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:admin_app/view/screens/auth/forgetpassword/success_resetpassword.dart';
import 'package:admin_app/view/screens/auth/forgetpassword/verifycode.dart';
import 'package:admin_app/view/screens/auth/login.dart';
import 'package:admin_app/view/screens/auth/signup.dart';
import 'package:admin_app/view/screens/auth/success_signup.dart';
import 'package:admin_app/view/screens/auth/verifycodesignup.dart';
import 'package:admin_app/view/screens/language.dart';
import 'package:admin_app/view/screens/orders/Order_Screen.dart';
import 'package:admin_app/view/screens/orders/archive.dart';
import 'package:admin_app/view/screens/orders/details.dart';
import 'package:admin_app/view/screens/orders/pending.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
List<GetPage<dynamic>>? routes = [
  GetPage(  name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  //CATEGORY
  GetPage(name: AppRoute.categoryview, page: () => const Categortview()),
  GetPage(name: AppRoute.categoryadd, page: () => const Catedoryadd()),
  GetPage(name: AppRoute.categoryedit, page: () => const Catedoryedit()),
  GetPage(name: AppRoute.categoryedit, page: () => const OrdersDetails()),
  //Items
  GetPage(name: AppRoute.itemsview, page: () => const Itemsview()),
  GetPage(name: AppRoute.itemsadd, page: () => const Itemsaddpage()),
  GetPage(name: AppRoute.itemsedit, page: () => const Itemseditpage()),
  //orders
  GetPage(name: AppRoute.orderscreen, page: () => const OrderScreen()),


];
 
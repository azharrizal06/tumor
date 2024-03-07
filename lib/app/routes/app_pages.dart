import 'package:get/get.dart';

import '../modules/hasil/bindings/hasil_binding.dart';
import '../modules/hasil/views/hasil_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HASIL,
      page: () => HasilView(),
      binding: HasilBinding(),
    ),
    
  ];
}

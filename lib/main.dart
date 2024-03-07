import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test/app/wiget/scren.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snp) {
          if (snp.connectionState == ConnectionState.waiting) {
            return scren();
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: Routes.HOME,
              getPages: AppPages.routes,
            );
          }
        });
  }
}

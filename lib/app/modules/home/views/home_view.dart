// ignore_for_file: use_build_context_synchronously, deprecated_member_use, avoid_single_cascade_in_expression_statements

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          leadingWidth: 50,
          leading: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(0.1),
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(
            " Brain Tumor Detection",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        // backgroundColor: Colors.grey,
        body: ListView(
          children: [
            Container(
              // height: tinggi * 0.6,
              // width: lebar * 0.5,
              // color: Colors.amber,
              padding: EdgeInsets.all(20),
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  SizedBox(height: 20),
                  Center(
                    child: Obx(
                      () => controller.isLoading.value == true
                          ? Center(
                              child: Lottie.asset('assets/scananimasi.json',
                                  width: 250), // Tampilkan indikator loading
                            )
                          : Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Obx(
                                    () => controller.image != null
                                        ? Container(
                                            height: tinggi * 0.4,
                                            width: lebar * 0.7,
                                            color: Colors.amber,
                                            child: Image.file(
                                              controller.image!,
                                              width: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Lottie.asset('assets/gambar.json',
                                            width: 250),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => controller.image != null
                  ? Column(
                    
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              minimumSize:
                                  MaterialStateProperty.all(Size(300, 40)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green[400]),
                              side: MaterialStatePropertyAll(BorderSide(
                                  width: 3, color: Color(0xff00ffff)))),
                          onPressed: () async {
                            await controller.classifyImage();
                            if (controller.output != null &&
                                controller.output!.isNotEmpty) {
                              double confidence =
                                  controller.output![0]["confidence"] ?? 0.0;
                              String label = controller.output![0]["label"];

                              AwesomeDialog(
                                context: context,
                                dialogType: label != "Notumor"
                                    ? DialogType.error
                                    : DialogType.success,
                                animType: AnimType.scale,
                                title: label != "Notumor" ? 'Error' : 'Success',
                                body: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        '${label} Detection',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: label != 'Notumor'
                                                ? Colors.red
                                                : Colors.green),
                                      ),
               
               
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CircularPercentIndicator(
                                        radius: 60.0,
                                        lineWidth: 20,
                                        percent: confidence,
                                        center: Text(
                                            "${(confidence * 100).toInt()}%"),
                                        progressColor: label != "Notumor"
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              )..show();
                            }
                          },
                          child: Text(
                            'Detection',
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              minimumSize:
                                  MaterialStateProperty.all(Size(300, 40)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green[400]),
                              side: MaterialStatePropertyAll(BorderSide(
                                  width: 3, color: Color(0xff00ffff)))),
                          onPressed: controller.reset,
                          child: Text(
                            'RESET',
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              minimumSize:
                                  MaterialStateProperty.all(Size(300, 40)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green[400]),
                              side: MaterialStatePropertyAll(BorderSide(
                                  width: 3, color: Color(0xff00ffff)))),
                          onPressed: controller.chooseImage,
                          child: Text(
                            'Pilih dari Galeri',
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                minimumSize:
                                    MaterialStateProperty.all(Size(300, 40)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green[400]),
                                side: MaterialStatePropertyAll(BorderSide(
                                    width: 3, color: Color(0xff00ffff)))),
                            onPressed: controller.cameraRoll,
                            child: Text(
                              'Ambil Foto',
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
        
          ],
        ),
      ),
    );
  }
}

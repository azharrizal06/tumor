import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class HomeController extends GetxController {
  Rx<File?> _image = Rx<File?>(null);
  RxList? _output = RxList.empty();
  RxBool isLoading = RxBool(false);

  File? get image => _image.value;
  List? get output => _output;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    Tflite.loadModel(
      model: 'assets/braintumorv2.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void onClose() {
    super.onClose();
    Tflite.close();
  }

  Future<void> classifyImage() async {
    var output = await Tflite.runModelOnImage(
      path: _image.value!.path,
      numResults: 4,
      threshold: 0.7,
      imageMean: 0.0,
      imageStd: 255,
    );
    // if (output != null && output!.isNotEmpty) {
    //   Get.dialog(Dialog(
    //     child: Padding(
    //       padding: const EdgeInsets.all(20),
    //       child: Wrap(
    //         alignment: WrapAlignment.center,
    //         children: [
    //           CircularPercentIndicator(
    //             radius: 60.0,
    //             lineWidth: 20,
    //             percent: output[0]["confidence"] ?? 0.0,
    //             center: Text(
    //                 "${((output[0]["confidence"] ?? 0.0) * 100).toInt()}%"),
    //             progressColor:
    //                 output[0]["label"] != "Notumor" ? Colors.red : Colors.green,
    //           ),
    //           // Text("${output[0]["confidence"]}"),
    //           Text('${output[0]["label"]}')
    //         ],
    //       ),
    //     ),
    //   ));
    // }

    // isLoading.value = true;

    // await Future.delayed(Duration(seconds: 5));
    _output?.assignAll(output!);
    // isLoading.value = false;
    // print(output);
  }

  void chooseImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    _image.value = File(image.path);
    // isLoading.value = true;
    // await Future.delayed(Duration(seconds: 5));
    // classifyImage();
    // isLoading.value = false;
  }

  void cameraRoll() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    _image.value = File(image.path);
    // isLoading.value = true;
    // await Future.delayed(Duration(seconds: 5));

    // classifyImage();
    // isLoading.value = false;
  }

  void reset() {
    _image.value = null;
    _output?.clear();
  }
}

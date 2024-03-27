import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeController extends GetxController {
  //variabel pendukung
  Rx<File?> _image = Rx<File?>(null);
  RxList? _output = RxList.empty();
  RxBool isLoading = RxBool(false);

  File? get image => _image.value;
  List? get output => _output;

  final picker = ImagePicker();

  @override
  void onInit() {
    //menjalankan ketika aplikasi pertama kali di buka
    super.onInit();
    Tflite.loadModel(
      model: 'assets/braintumorv2.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void onClose() {
    //menutup agar tidak terjadi bug
    super.onClose();
    Tflite.close();
  }

//fungsion clasifikasi
  Future<void> classifyImage() async {
    var output = await Tflite.runModelOnImage(
      path: _image.value!.path,
      numResults: 4,
      threshold: 0.7,
      imageMean: 0.0,
      imageStd: 255,
    );

    _output?.assignAll(output!);
  }

//fungsion pilih imagae
  void chooseImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    _image.value = File(image.path);
  }

//fungsion buka camera
  void cameraRoll() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    _image.value = File(image.path);
  }

//fungsion untuk riset gambar
  void reset() {
    _image.value = null;
    _output?.clear();
  }
}

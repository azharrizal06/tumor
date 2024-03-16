import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/hasil_controller.dart';

class HasilView extends GetView<HasilController> {
  const HasilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('informasi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Text(
              '     Glioma, Meningioma, Pituitary, dan Non-Tumor adalah beberapa jenis tumor yang dapat terjadi di dalam otak dan sistem saraf pusat. Berikut penjelasan singkat tentang masing-masing:',
              textAlign: TextAlign.justify,
              // style: TextStyle(fontSize: 15),
            ),
            Text(
              "1. Glioma",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Meningioma adalah jenis tumor yang berasal dari selaput yang melapisi otak dan sumsum tulang belakang, yang disebut meningi.\n Glioma adalah tumor ganas yang bisa berkembang di berbagai bagian otak, termasuk otak besar, batang otak, dan sumsum tulang belakang.\nJenis-jenis glioma meliputi glioblastoma multiforme (GBM), astrocytoma, oligodendroglioma, dan ependymoma.",
              textAlign: TextAlign.justify,
            ),
            Text(
              "2.Meningioma",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Meningioma adalah jenis tumor yang berasal dari selaput yang melapisi otak dan sumsum tulang belakang, yang disebut meningi.\n Biasanya meningioma adalah tumor jinak, meskipun dalam kasus tertentu dapat menjadi ganas.\nMeningioma biasanya tumbuh lambat dan sering ditemukan secara kebetulan selama pemeriksaan pencitraan otak rutin.",
              textAlign: TextAlign.justify,
            ),
            Text(
              "3. Pituitary",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Pituitary adenoma adalah tumor yang berasal dari kelenjar pituitari, yang terletak di pangkal otak.\nTumor ini dapat memengaruhi produksi hormon oleh kelenjar pituitari, yang mengatur berbagai fungsi tubuh.\nPituitary adenoma dapat menyebabkan gangguan hormon, tekanan pada struktur otak sekitarnya, atau gangguan penglihatan tergantung pada ukuran dan lokasi tumor.",
              textAlign: TextAlign.justify,
            ),
            Text(
              "4. Non-Tumor (Tidak Ada Tumor):",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Non-tumor mengacu pada kondisi di mana tidak ada pertumbuhan atau perkembangan abnormal jaringan tumor di dalam otak.\nMeskipun tidak ada tumor, gangguan neurologis atau kondisi medis lainnya masih dapat terjadi di otak dan sistem saraf pusat, seperti peradangan, infeksi, atau gangguan pembuluh darah.\nPemeriksaan pencitraan otak seperti MRI atau CT scan dapat membantu mengidentifikasi apakah ada tumor atau tidak, serta kondisi medis lainnya yang mungkin memengaruhi fungsi otak.",
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}

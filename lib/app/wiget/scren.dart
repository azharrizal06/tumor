import 'package:flutter/material.dart';

class scren extends StatelessWidget {
  const scren({super.key});

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              height: tinggi * 0.5,
              width: lebar * 0.9,
              // color: Colors.amber,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipOval(
                      child: Container(
                        height: tinggi * 0.25,
                        width: lebar * 0.4,
                        color: Colors.green.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Container(
                        color: Colors.green.withOpacity(0.7),
                        height: tinggi * 0.4,
                        width: lebar * 0.65,
                      ),
                    ),
                  ),
                  Center(child: Image.asset("assets/orang.png"))
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Brain Tumor Detection",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

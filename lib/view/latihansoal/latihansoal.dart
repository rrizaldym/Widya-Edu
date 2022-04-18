import 'package:flutter/material.dart';

class LatihanSoal extends StatefulWidget {
  const LatihanSoal({Key? key}) : super(key: key);

  @override
  State<LatihanSoal> createState() => _LatihanSoalState();
}

class _LatihanSoalState extends State<LatihanSoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Soal"),
      ),
      body: Container(
        child: Column(
          children: [
            TabBar(
              tabs: List.generate(
                  // soal!.data!.length,
                  10,
                  (index) => Text(
                        "${index + 1}",
                        style: const TextStyle(color: Colors.black),
                      )),
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                    // soal!.data!.length,
                    10,
                    (index) => Column(
                          children: [Text("Soal no $index")],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

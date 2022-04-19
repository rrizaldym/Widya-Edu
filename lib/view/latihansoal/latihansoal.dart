import 'package:google_fonts/google_fonts.dart';
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
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Latihan Soal',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
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
    );
  }
}

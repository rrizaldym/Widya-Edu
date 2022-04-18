import 'package:edspertidapp/controller/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaketSoal extends StatefulWidget {
  const PaketSoal({
    Key? key,
  }) : super(key: key);

  @override
  State<PaketSoal> createState() => _PaketSoalState();
}

class _PaketSoalState extends State<PaketSoal> {
  late int value;
  final isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: Text('Kimia',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        elevation: 5,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Dari Paket Soal!")));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Pilih Paket Soal",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff444444),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: widget.value == null || (widget.value! + 1) % 2 == 0
                  child: (context.watch<StateProvider>().index + 1) % 2 == 0
                      // child: !isLoading
                      ? buildError()
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 150 / 100),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return buildCard(index);
                          },
                        )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard(int index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/latihansoal");
        },
        child: Container(
          height: 100,
          // width: 150,
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: const Color(0xffF3F7F8),
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        scale: 4,
                        image: AssetImage("assets/icons/ic_note.png"))),
              ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Trigonometri",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "\n0/10 Soal",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff8E8E8E),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      );

  Widget buildError() => Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        scale: 2,
                        alignment: Alignment.bottomCenter,
                        image: AssetImage("assets/images/img_not_found.png"))),
              )),
          Flexible(
            flex: 1,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "Yah, Paket tidak tersedia",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                    )),
                const TextSpan(
                    text:
                        "\nTenang, masih banyak yang bisa kamu pelajari.\ncari lagi yuk!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff99A1AC),
                    )),
              ]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMapel extends StatefulWidget {
  const ListMapel({Key? key}) : super(key: key);

  @override
  State<ListMapel> createState() => _ListMapelState();
}

class _ListMapelState extends State<ListMapel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: Text('Pilih Pelajaran',
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
                const SnackBar(content: Text("Dari Pilih Pelajaran!")));
          },
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemBuilder: (context, index) {
            return buildCard(index);
          }),
    );
  }

  Widget buildCard(int index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/paketsoal", arguments: index);
          // arguments: 4);
          print(index);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Kimia!"), duration: Duration(seconds: 1)));
        },
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    // agak pias warnanya masuk ke putih
                    color: const Color(0xffF3F7F8),
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        scale: 2,
                        image: AssetImage("assets/icons/ic_kimia.png"))),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: "Kimia",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "\n0/50 Paket latihan soal",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff8E8E8E),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      const LinearProgressIndicator(
                        minHeight: 5,
                        color: Color(0xff3A7FD5),
                        backgroundColor: Color(0xffF0F0F0),
                        value: 0.5,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    this.result
  }) : super(key: key);
  final String? result;

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Transform.translate(
            offset: const Offset(-25, 0),
            child: Text('Tutup',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ),
        ),
        backgroundColor: const Color(0xff3A7FD5),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: const [
                    TextSpan(
                        text: "Selamat\n",
                        style: TextStyle(
                          fontSize: 24,
                        )),
                    TextSpan(text: "Kamu telah menyelesaikan Kuiz ini"),
                  ],
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                textAlign: TextAlign.center,
              ),
              ClipRRect(
                child: Image.asset("assets/images/img_result.png", scale: 2),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: "Nilai kamu :\n",
                        style: TextStyle(
                          fontSize: 13,
                        )),
                    TextSpan(
                        text: routes["result"],
                        style: const TextStyle(
                          fontSize: 96,
                        )),
                  ],
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}

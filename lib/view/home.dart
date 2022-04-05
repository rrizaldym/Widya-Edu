import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Column(
            children: [
              buildProfile(),
              buildBanner(),
              buildMapel(),
              buildNews(),
            ],
          ),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // hoverElevation: 50,
        // autofocus: true,
        tooltip: "Diskusi Soal",
        elevation: 10,
        child: Container(
          // color: Colors.red,
          alignment: const Alignment(0, 0.5),
          child: Image.asset(
            "assets/icons/ic_discuss.png",
            scale: 2,
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("FloatingActionButton!")));
          // Overlay.of(context).insert(entry);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            // color: Colors.grey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/ic_home.png",
                      scale: 2,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Home!")));
                    },
                  ),
                  Text("Home",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              // const SizedBox(
              //   width: 100,
              //   child: Center(
              //     child: Text(
              //       "Diskusi Soal",
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      // Icons.account_circle_outlined,
                      Icons.account_circle_rounded,
                      color: Color(0xff9BBCBC),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Profile!")));
                    },
                  ),
                  Text("Profile",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfile() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Hai, Altop",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                      text: "\nSelamat Datang",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      )),
                ])),
                // Text("Hai, Altop \nSelamat Datang", style: ,),
              ],
            ),
            CircleAvatar(
              child: Image.asset("assets/icons/ic_avatar.png"),
            )
          ]),
        ),
      );

  Widget buildBanner() => Container(
        height: 170,
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff3A7FD5),
          ),
          child: Row(
            children: [
              Container(
                // padding: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Text("Mau kerjain\nlatihan soal\napa hari ini?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/img_home.png"))),
              )),
            ],
          ),
        ),
      );

  Widget buildMapel() => SizedBox(
        height: 400,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Pelajaran",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/listmapel");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Lihat Semua!"),
                        duration: Duration(seconds: 1)));
                  },
                  child: Text(
                    "Lihat Semua",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3A7FD5),
                    ),
                  ),
                ),
              ],
            ),
            // listview
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
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
                                  // fit: BoxFit.scaleDown,
                                  scale: 2,
                                  image:
                                      AssetImage("assets/icons/ic_kimia.png"))),
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
                                      text: "Matematika",
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
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildNews() => Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terbaru",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/img_banner.png"))),
              ),
            ),
          ],
        ),
      );
}

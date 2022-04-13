import 'package:edspertidapp/controller/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Akun Saya',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        actions: [
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("To setting screen!")));
              },
              child: Text('Edit',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/icons/ic_home.png",
                        scale: 2,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/home",
                        );
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("Home",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chat,
                        color: Colors.transparent,
                      ),
                      // icon: Image.asset(
                      //   "assets/icons/ic_discuss.png",
                      //   colorBlendMode: BlendMode.modulate,
                      //   scale: 2,
                      // ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Diskusi Soal!")));
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("Diskusi Soal",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Color(0xff9BBCBC),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/profile",
                        );
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          buildCard(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    buildProfile(),
                    const SizedBox(
                      height: 20,
                    ),
                    builLogoutButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCard() => Container(
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: const BoxDecoration(
          color: Color(0xff3A7FD5),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 10, 30, 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "${Provider.of<StateProvider>(context, listen: false).name}",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            )),
                        TextSpan(
                            text:
                                "\n${Provider.of<StateProvider>(context, listen: false).school}",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            )),
                      ])),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  child: Image.asset(
                    "assets/icons/ic_avatar.png",
                  ),
                ),
              )
            ]),
      );

  Widget buildProfile() => Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                "Identitas Diri",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Nama Lengkap",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text:
                          "\n${Provider.of<StateProvider>(context, listen: false).name}",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text:
                          "\n${Provider.of<StateProvider>(context, listen: false).email}",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Jenis Kelamin",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text: Provider.of<StateProvider>(context, listen: false)
                                  .gender !=
                              null
                          ? "\n${Provider.of<StateProvider>(context, listen: false).gender}"
                          : "",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Kelas",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text:
                          "\n${Provider.of<StateProvider>(context, listen: false).kelas}",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Sekolah",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text:
                          "\n${Provider.of<StateProvider>(context, listen: false).school}",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
                ],
              ),
            )
          ],
        ),
      );

  Widget builLogoutButton() => ElevatedButton.icon(
        onPressed: () => signOut(),
        icon: const Icon(
          Icons.login,
          color: Colors.red,
        ),
        label: Text(
          "Keluar",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          primary: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
        ),
      );

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ImageProvider _login = const AssetImage("assets/images/img_login.png");
  // late Image _login;

  // @override
  // void initState() {
  //   super.initState();
  //   _login = Image.asset("assets/images/img_login.png");
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   precacheImage(_login.image, context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(10, 0),
          child: Text('Login',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                flex: 3,
                child:
                    // _login),
                    Container(
                        decoration: BoxDecoration(
                            // color: Colors.grey,
                            image: DecorationImage(image: _login)))),
            SizedBox(
              height: 10,
              child: Container(
                  // color: Colors.red,
                  ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.grey,
                  child: Column(
                    children: [
                      Text.rich(
                        const TextSpan(text: "Selamat Datang"),
                        style: GoogleFonts.poppins(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      // Text.rich(
                      //   const TextSpan(text: "Selamat Datang"),
                      //   style: TextStyle(
                      //       fontSize: 22, fontWeight: FontWeight.bold),
                      // ),
                      Text.rich(
                          const TextSpan(
                              text:
                                  "Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal"),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          )),
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Masuk dengan Google!")));
                        },
                        icon: BrandLogo(BrandLogos.google, size: 26),
                        label: const Text("Masuk dengan Google",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            )),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(
                              MediaQuery.of(context).size.width * 0.8),
                          side: const BorderSide(color: Color(0xff01B1AF)),
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          primary: Colors.white,
                        )),
                    ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Masuk dengan Apple ID!")));
                        },
                        icon: BrandLogo(BrandLogos.apple,
                            color: Colors.white, size: 26),
                        label: const Text("Masuk dengan Apple ID",
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(
                              MediaQuery.of(context).size.width * 0.8),
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          primary: Colors.black,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

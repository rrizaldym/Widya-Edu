import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
                flex: 3, child: Image.asset("assets/images/img_login.png")),
            SizedBox(
              height: 20,
              child: Container(
                  // color: Colors.red,
                  ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.grey,
                  child: Column(
                    children: const [
                      Text.rich(
                        TextSpan(text: "Selamat Datang"),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text.rich(
                          TextSpan(
                              text:
                                  "Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Container(
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Clicked!")));
                          },
                          icon: BrandLogo(BrandLogos.google, size: 26),
                          label: const Text("Masuk dengan Google",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              )),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            primary: Colors.white,
                          )),
                      ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Clicked!")));
                          },
                          icon: BrandLogo(BrandLogos.apple,
                              color: Colors.white, size: 26),
                          label: const Text("Masuk dengan Apple ID",
                              style: TextStyle(
                                fontSize: 17,
                              )),
                          style: ElevatedButton.styleFrom(
                            // side: BorderSide(width: 25),
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            primary: Colors.black,
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

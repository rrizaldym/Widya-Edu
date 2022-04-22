import 'package:edspertidapp/repository/auth_api.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/data_by_user_email.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ImageProvider _imgLogin =
      const AssetImage("assets/images/img_login.png");
  var isLoading = true;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final response = await AuthAPi().getUserbyEmail(user.email);
      if (response != null) {
        print(response);
        final userData = DataUserByEmail.fromJson(response);
        if (userData.status == 1) {
          Navigator.pushReplacementNamed(context, "/home");
        } else {
          Navigator.pushReplacementNamed(context, "/register");
        }
      } else {
        print("Terjadi kesalahan saat pengambilan data user");
        setState(() {
          isLoading = false;
        });
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   content: Text("Terjadi kesalahan saat pengambilan data user"),
        //   duration: Duration(seconds: 2),
        // ));
      }
    } else {
      print("Gagal Masuk");
      setState(() {
        isLoading = false;
      });
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("Gagal Masuk"),
      //   duration: Duration(seconds: 2),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            backgroundColor: Color(0xff3A7FD5),
            body: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                backgroundColor: Color(0xffF0F0F0),
                valueColor: AlwaysStoppedAnimation(Color(0xff3A7FD5)),
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              final difference = DateTime.now().difference(timeBackPressed);
              final isExitWarning = difference >= const Duration(seconds: 2);
              timeBackPressed = DateTime.now();

              if (isExitWarning) {
                const message = "Press back again to exit";
                Fluttertoast.showToast(
                    msg: message,
                    fontSize: 15,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.grey);
                return false;
              } else {
                Fluttertoast.cancel();
                return true;
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Transform.translate(
                  offset: const Offset(10, 0),
                  child: Text('Login',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                backgroundColor: Color.fromARGB(0, 190, 171, 171),
                elevation: 0,
              ),
              body: Center(
                child: Column(
                  children: [
                    Flexible(
                        flex: 3,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image: _imgLogin)))),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text.rich(
                              const TextSpan(text: "Selamat Datang"),
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text.rich(
                                const TextSpan(
                                    text:
                                        "Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal"),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: const Color(0xff6A7483),
                                )),
                          ],
                        )),
                    Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildGoogleLogin(),
                            buildAppleLogin(),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
  }

  Widget buildGoogleLogin() => ElevatedButton.icon(
      onPressed: () async {
        await signInWithGoogle();
        final user = FirebaseAuth.instance.currentUser;
        user != null
            ? Navigator.pushNamed(context, "/register")
            : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("User tdak diteukan!"),
                duration: Duration(seconds: 2),
              ));
      },
      icon: BrandLogo(BrandLogos.google, size: 26),
      label: const Text("   Masuk dengan Google",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.8),
        side: const BorderSide(color: Color(0xff01B1AF)),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        primary: Colors.white,
      ));

  Widget buildAppleLogin() => ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, "/register");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Masuk dengan Apple ID!")));
      },
      icon: BrandLogo(BrandLogos.apple, color: Colors.white, size: 26),
      label: const Text("   Masuk dengan Apple ID",
          style: TextStyle(
            fontSize: 17,
          )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.8),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        primary: Colors.black,
      ));
}

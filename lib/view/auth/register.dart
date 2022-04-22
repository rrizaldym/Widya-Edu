// ignore_for_file: unnecessary_null_comparison

import 'package:edspertidapp/repository/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edspertidapp/controller/state_provider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final user = FirebaseAuth.instance.currentUser!.email;
  // final _email = TextEditingController();
  TextEditingController? _email;
  final _name = TextEditingController();
  final _school = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (user != null) {
      _email = TextEditingController(text: user.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: Text('Yuk isi data diri',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              buildEmail(),
              const SizedBox(
                height: 10,
              ),
              buildName(),
              const SizedBox(
                height: 10,
              ),
              buildGender(),
              const SizedBox(
                height: 10,
              ),
              buildClass(),
              const SizedBox(
                height: 10,
              ),
              buildSchool(),
              const SizedBox(
                height: 30,
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Email",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: const Color(0xffd6d6d6)),
            ),
            child: TextField(
              controller: _email,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: _email!.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () {
                          _email!.clear();
                        },
                        icon: const Icon(Icons.close)),
                hintText: "email@domain.com",
                hintStyle: const TextStyle(color: Color(0xffaaaaaa)),
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      );

  Widget buildName() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Nama Lengkap",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: const Color(0xffd6d6d6)),
            ),
            child: TextField(
              controller: _name,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                suffixIcon: _name.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () {
                          _name.clear();
                        },
                        icon: const Icon(Icons.close)),
                hintText: "contoh : Ihsan Adireja",
                hintStyle: const TextStyle(color: Color(0xffaaaaaa)),
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      );

  bool isButtonActive1 = true;
  bool isButtonActive2 = true;
  String? selectedGender;
  Widget buildGender() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Jenis Kelamin",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: isButtonActive1
                      ? () {
                          setState(() {
                            isButtonActive1 == isButtonActive2
                                ? isButtonActive1 = !isButtonActive1
                                : () {
                                    isButtonActive2 = !isButtonActive2;
                                    isButtonActive1 = !isButtonActive1;
                                  }();
                            selectedGender = 'Laki-laki';
                          });
                        }
                      : null,
                  child: Text("Laki-laki",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isButtonActive1 ? Colors.black : Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Colors.white,
                    onSurface: Colors.blue,
                  )),
              ElevatedButton(
                  onPressed: isButtonActive2
                      ? () {
                          setState(() {
                            isButtonActive1 == isButtonActive2
                                ? isButtonActive2 = !isButtonActive2
                                : () {
                                    isButtonActive1 = !isButtonActive1;
                                    isButtonActive2 = !isButtonActive2;
                                  }();
                            selectedGender = 'Perempuan';
                          });
                        }
                      : null,
                  child: Text("Perempuan",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isButtonActive2 ? Colors.black : Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width * 0.4),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Colors.white,
                    onSurface: Colors.blue,
                  )),
            ],
          )),
        ],
      );

  List<String> items = [
    "Kelas 10",
    "Kelas 11",
    "Kelas 12",
  ];
  String? _dropdownValue;
  Widget buildClass() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Kelas",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: const Color(0xffd6d6d6)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: const Text("pilih kelas"),
                  isExpanded: true,
                  onChanged: (String? value) {
                    setState(() {
                      _dropdownValue = value!;
                    });
                  },
                  value: _dropdownValue,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                ),
              ))
        ],
      );

  Widget buildSchool() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Nama Sekolah",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: const Color(0xffd6d6d6)),
            ),
            child: TextField(
              controller: _school,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                suffixIcon: _school.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () {
                          _school.clear();
                        },
                        icon: const Icon(Icons.close)),
                hintText: "nama sekolah",
                hintStyle: const TextStyle(color: Color(0xffaaaaaa)),
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      );

  Widget buildButton() => Center(
        child: ElevatedButton(
          child: const Text("Daftar",
              style: TextStyle(
                fontSize: 17,
              )),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.8),
            padding: const EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            primary: const Color(0xff3A7FD5),
          ),
          onLongPress: () {
            Navigator.pushReplacementNamed(context, "/home");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("It's long pressed Login!")));
          },
          onPressed: () {
            _email!.text != null &&
                    _name.text != null &&
                    selectedGender != null &&
                    _dropdownValue != null &&
                    _school.text != null
                ? () {
                    registData();
                    Navigator.pushReplacementNamed(context, "/home");
                  }()
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill the blank!")));
          },
        ),
      );

  Future<void> registData() async {
    final body = {
      "user_name": _name.text,
      "user_email": _email!.text,
      "user_whatsapp": "082255550496",
      "user_foto":
          "https://api.widyaedu.com/assets/uploads/avatar/5a57317764486c77636d396d6157786c_emptyprofile.png",
      "user_propinsi": "Prov. Aceh",
      "user_kabupaten": "Kab. Aceh Barat",
      "sosmed": "@widyaedu",
      "user_prop_sekolah": "Prov. D.I. Yogyakarta",
      "user_kab_sekolah": "Kab. Sleman",
      "user_asal_sekolah": _school.text,
      "kelas": "12",
      "uniqcode": "7552",
      "referral": "EDUEE2",
      "date_create": "2022-02-24 08:28:55",
      "jenjang": "SMA",
      "user_gender": selectedGender,
      "user_propinsi_id": "060000",
      "user_prop_sekolah_id": "040000",
      "user_kab_sekolah_id": "040200",
      "user_token":
          "cmZvRr5RRLuLGJX64T-Grb:APA91bF3DkBHPR3NtBqm_f12d9wNd-YvyjJmEkU7f4smY2d8ODJCvGBitC6LExh-GJ27qinvx0NGGkkppyiJIoxG_FDKOSdggLU-g5-W7eJeqzv5JrYUSg4U4xvXU0E_VuiP20gVEUSV",
      "verified_phone": "true",
      "user_status": "verified",
      "apple_id": "empty"
    };
    // final result = await AuthAPi().postRegisterUser(body);
    // print(result);
    context.read<StateProvider>().getProfile(
        _email!.text, _name.text, selectedGender, _dropdownValue, _school.text);
    _email!.clear();
    _name.clear();
    _school.clear();
    setState(() {
      _dropdownValue = null;
      selectedGender = null;
      isButtonActive1 = true;
      isButtonActive2 = true;
    });
  }
}

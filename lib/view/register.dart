import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _school = TextEditingController();

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
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Clicked!")));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildEmail(),
              const SizedBox(
                height: 20,
              ),
              buildName(),
              const SizedBox(
                height: 20,
              ),
              buildGender(),
              const SizedBox(
                height: 20,
              ),
              buildClass(),
              const SizedBox(
                height: 20,
              ),
              buildSchool(),
              const SizedBox(
                height: 20,
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
                suffixIcon: _email.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () {
                          _email.clear();
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$selectedGender"),
                              duration: const Duration(seconds: 1),
                            ));
                          });
                        }
                      : null,
                  child: Text("Laki-laki",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$selectedGender"),
                              duration: const Duration(seconds: 1),
                            ));
                          });
                        }
                      : null,
                  child: Text("Perempuan",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
  String? _dropdownValue = 'Kelas 10';
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
                  hint: Text("Pilih Kelas",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
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
            onPressed: () {
              Navigator.pushNamed(context, "/home");
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Daftar!")));
            },
            child: const Text("Daftar",
                style: TextStyle(
                  fontSize: 17,
                )),
            style: ElevatedButton.styleFrom(
              fixedSize:
                  Size.fromWidth(MediaQuery.of(context).size.width * 0.8),
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              primary: const Color(0xff3A7FD5),
            )),
      );
}

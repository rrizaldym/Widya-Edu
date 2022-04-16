import 'package:edspertidapp/controller/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _school = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Akun',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 50,
                  child: Text(
                    "Data Diri",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              buildName(),
              const SizedBox(
                height: 10,
              ),
              buildEmail(),
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

  Widget buildName() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama Lengkap",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.3),
              )),
          TextField(
            controller: _name,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
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
              hintText: "contoh : Ihsan Adireja",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
          )
        ],
      );

  Widget buildEmail() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.3),
              )),
          TextField(
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
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
          )
        ],
      );

  List<String> gender = [
    "Laki-Laki",
    "Perempuan",
  ];
  String? _dropdownGender;
  Widget buildGender() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Jenis kelamin",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.3),
              )),
          DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: Text(
              "Pilih Jenis Kelamin",
              style: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
            isExpanded: true,
            onChanged: (String? value) {
              setState(() {
                _dropdownGender = value!;
              });
            },
            value: _dropdownGender,
            items: gender
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
          ),
        ],
      );

  List<String> items = [
    "Kelas 10",
    "Kelas 11",
    "Kelas 12",
  ];
  String? _dropdownClass;
  Widget buildClass() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.3),
              )),
          DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: Text(
              "Pilih Kelas",
              style: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
            isExpanded: true,
            onChanged: (String? value) {
              setState(() {
                _dropdownClass = value!;
              });
            },
            value: _dropdownClass,
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
          ),
        ],
      );

  Widget buildSchool() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sekolah",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.3),
              )),
          TextField(
            controller: _school,
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
              hintText: "nama sekolah",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
          )
        ],
      );

  Widget buildButton() => Center(
        child: ElevatedButton(
          child: const Text("Perbarui Data",
              style: TextStyle(
                fontSize: 17,
              )),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            padding: const EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            primary: const Color(0xff3A7FD5),
          ),
          onPressed: () {
            _email.text != null &&
                    _name.text != null &&
                    _dropdownGender != null &&
                    _dropdownClass != null &&
                    _school.text != null
                ? () {
                    context.read<StateProvider>().getProfile(
                        _email.text,
                        _name.text,
                        _dropdownGender,
                        _dropdownClass,
                        _school.text);
                    print(
                        "${Provider.of<StateProvider>(context, listen: false).email}");
                    print(
                        "${Provider.of<StateProvider>(context, listen: false).name}");
                    print(
                        "${Provider.of<StateProvider>(context, listen: false).gender}");
                    print(
                        "${Provider.of<StateProvider>(context, listen: false).kelas}");
                    print(
                        "${Provider.of<StateProvider>(context, listen: false).school}");
                    _email.clear();
                    _name.clear();
                    _school.clear();
                    setState(() {
                      _dropdownGender = null;
                      _dropdownClass = null;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Data Telah Diperbarui!")));
                  }()
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill the blank!")));
          },
        ),
      );
}

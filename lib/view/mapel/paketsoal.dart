import 'package:edspertidapp/controller/state_provider.dart';
import 'package:edspertidapp/models/sub_materi_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/materi.dart';
import '../../repository/latihan_soal_api.dart';

class PaketSoal extends StatefulWidget {
  const PaketSoal({
    Key? key,
  }) : super(key: key);

  @override
  State<PaketSoal> createState() => _PaketSoalState();
}

class _PaketSoalState extends State<PaketSoal> {
  bool isLoading = true;

  Materi? materi;
  SubMateriList? subMateriList;

  @override
  void initState() {
    super.initState();
    getMateri();
  }

  Future<void> getMateri() async {
    final response = await LatihanSoalApi().getMateri(
        //? Data diambil dari Firebase
        "alitopan@widyaedu.com",
        Provider.of<StateProvider>(context, listen: false).courseId);
    if (response != null) {
      print(response);
      materi = Materi.fromJson(response);
      setState(() {});
      context.read<StateProvider>().getCourseContentId(
          materi!.data!.listCourseContent![0].courseContentId!);
      context
          .read<StateProvider>()
          .getCourseName(materi!.data!.listCourseContent![0].courseName!);
      getSubMateri();
    } else {
      print("Terjadi kesalahan saat pengambilan data Materi!");
    }
  }

  Future<void> getSubMateri() async {
    final response = await LatihanSoalApi().getSubMateri(
        //? Data diambil dari Firebase
        "alitopan@widyaedu.com",
        Provider.of<StateProvider>(context, listen: false).courseContentId);
    if (response != null) {
      print(response);
      subMateriList = SubMateriList.fromJson(response);
      isLoading = false;
      setState(() {});
    } else {
      print("Terjadi kesalahan saat pengambilan data Sub Materi!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              title: Transform.translate(
                offset: const Offset(-16, 0),
                child: Text(
                    Provider.of<StateProvider>(context, listen: false)
                        .courseName,
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
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Pilih Paket Soal",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff444444),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: subMateriList!.status == 0
                            ? buildError()
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 150 / 100),
                                itemCount: subMateriList!.data == null
                                    ? 0
                                    : subMateriList!.data!.length,
                                itemBuilder: (context, index) {
                                  return buildCard(
                                      index: index, list: subMateriList!);
                                },
                              )),
                  )
                ],
              ),
            ),
          );
  }

  Widget buildCard({
    required int index,
    required SubMateriList list,
  }) =>
      GestureDetector(
        onTap: () {
          // context
          //     .read<StateProvider>()
          //     .getSubCourseContentId(list.data![index].subCourseContentId!);
          Navigator.pushNamed(context, "/paketlatsol");
          print(list.data![index].courseId!);
        },
        child: Container(
          height: 100,
          // width: 150,
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: const Color(0xffF3F7F8),
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        scale: 4,
                        image: AssetImage("assets/icons/ic_note.png"))),
              ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: list.data![index].subCourseContentName,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "\n${list.data![index].jumlahDone}/${list.data![index].jumlahPaket} Soal",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff8E8E8E),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      );

  Widget buildError() => Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        scale: 2,
                        alignment: Alignment.bottomCenter,
                        image: AssetImage("assets/images/img_not_found.png"))),
              )),
          Flexible(
            flex: 1,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "Yah, Paket tidak tersedia",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                    )),
                const TextSpan(
                    text:
                        "\nTenang, masih banyak yang bisa kamu pelajari.\ncari lagi yuk!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff99A1AC),
                    )),
              ]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}

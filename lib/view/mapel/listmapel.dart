import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edspertidapp/controller/state_provider.dart';
import 'package:provider/provider.dart';

import '../../models/mata_pelajaran_list.dart';
import '../../repository/latihan_soal_api.dart';

class ListMapel extends StatefulWidget {
  const ListMapel({Key? key}) : super(key: key);

  @override
  State<ListMapel> createState() => _ListMapelState();
}

class _ListMapelState extends State<ListMapel> {
  MataPelajaranList? mapelList;

  @override
  void initState() {
    super.initState();
    getMapel();
  }

  Future<void> getMapel() async {
    final response =
        await LatihanSoalApi().getMataPelajaran("alitopan@widyaedu.com", "IPS");
    //? Data diambil dari Firebase
    if (response != null) {
      print(response);
      mapelList = MataPelajaranList.fromJson(response);
      setState(() {});
    } else {
      print("Terjadi kesalahan saat pengambilan data Mata Pelajaran!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: Text('Pilih Pelajaran',
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
      body: mapelList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: mapelList!.data == null ? 0 : mapelList!.data!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return buildCard(index: index, list: mapelList);
              }),
    );
  }

  Widget buildCard({required int index, required MataPelajaranList? list}) =>
      GestureDetector(
        onTap: () {
          list!.data![index].courseId != null
              ? () {
                  context
                      .read<StateProvider>()
                      .getCourseId(list.data![index].courseId!);
                  Navigator.pushNamed(
                    context,
                    "/paketsoal",
                  );
                  print(
                      "${Provider.of<StateProvider>(context, listen: false).courseId}");
                }()
              : print(int.parse(list.data![index].courseId!));
        },
        child: Container(
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
                    image: DecorationImage(
                        scale: 1.5,
                        image: NetworkImage(list!.data![index].urlCover!))),
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
                            text: list.data![index].courseName,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                "\n${list.data![index].jumlahDone}/${list.data![index].jumlahMateri} Paket latihan soal",
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
                      LinearProgressIndicator(
                        minHeight: 5,
                        color: const Color(0xff3A7FD5),
                        backgroundColor: const Color(0xffF0F0F0),
                        value: list.data![index].progress!.toDouble(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

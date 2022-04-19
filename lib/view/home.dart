import 'package:cached_network_image/cached_network_image.dart';
import 'package:edspertidapp/controller/state_provider.dart';
import 'package:edspertidapp/models/banner_list.dart';
import 'package:edspertidapp/models/mata_pelajaran_list.dart';
import 'package:edspertidapp/repository/latihan_soal_api.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repository/banner_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MataPelajaranList? mapelList;
  BannerList? bannerList;

  @override
  void initState() {
    super.initState();
    getMapel();
    getBanner();
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

  Future<void> getBanner() async {
    final response = await BannerApi().getBanner();
    if (response != null) {
      print(response);
      bannerList = BannerList.fromJson(response);
      setState(() {});
    } else {
      print("Terjadi kesalahan saat pengambilan data Banner!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: SafeArea(
            child: Column(
              children: [
                buildProfile(),
                buildBanner(),
                buildMapel(mapelList),
                buildNews(bannerList),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // tooltip: "Diskusi Soal",
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
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Diskusi Soal!")));
          // Overlay.of(context).insert(entry);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
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
                        Navigator.pushReplacementNamed(
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
                        Navigator.pushReplacementNamed(
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
                      text:
                          "Hai, ${Provider.of<StateProvider>(context, listen: false).name}",
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

  Widget buildMapel(MataPelajaranList? list) => SizedBox(
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
                    Navigator.pushNamed(
                      context,
                      "/listmapel",
                    );
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
            Flexible(
              child: list == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      // itemCount: list.data == null ? 0 : list.data!.length,
                      itemCount: 3,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return buildCard(list: list, index: index
                            // courseId: list.data![index].courseId,
                            // title: list.data![index].courseName,
                            // urlCover: list.data![index].urlCover,
                            // done: list.data![index].jumlahDone,
                            // jumlah: list.data![index].jumlahMateri,
                            // progress: list.data![index].progress!.toDouble(),
                            );
                      }),
            ),
          ],
        ),
      );

  Widget buildCard({
    required MataPelajaranList? list,
    required int index,
    // required String? courseId,
    // required String? title,
    // required String? urlCover,
    // required int? done,
    // required int? jumlah,
    // required double? progress,
  }) =>
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
              // CachedNetworkImage(
              //   imageUrl: list!.data![index].urlCover!,
              //   imageBuilder: (context, imageProvider) => Container(
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: imageProvider,
              //           fit: BoxFit.cover,
              //           colorFilter:
              //               ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
              //     ),
              //   ),
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xffF3F7F8),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        scale: 1.5,
                        // image: AssetImage("assets/icons/ic_kimia.png"))),
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

  Widget buildNews(BannerList? list) => Container(
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
            Flexible(
              child: list == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.data == null ? 0 : list.data!.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 20);
                      },
                      itemBuilder: (context, index) {
                        return buildCard2(index: index, list: list);
                      }),
            ),
          ],
        ),
      );

  Widget buildCard2({required int index, required BannerList? list}) =>
      Container(
        width: 280,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(list!.data![index].eventImage!))),
      );
}

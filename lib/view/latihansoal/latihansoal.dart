import 'package:edspertidapp/models/input_jawaban.dart';
import 'package:edspertidapp/models/kerjakan_soal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/state_provider.dart';
import '../../repository/latihan_soal_api.dart';

class LatihanSoal extends StatefulWidget {
  const LatihanSoal({Key? key}) : super(key: key);

  @override
  State<LatihanSoal> createState() => _LatihanSoalState();
}

class _LatihanSoalState extends State<LatihanSoal>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  KerjakanSoal? soal;
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    getSoalLatihan();
  }

  getSoalLatihan() async {
    final response = await LatihanSoalApi().postKerjakan(
        //? Data diambil dari Firebase
        "alitopan@widyaedu.com",
        Provider.of<StateProvider>(context, listen: false).exerciseId);
    if (response != null) {
      print(response);
      soal = KerjakanSoal.fromJson(response);
      _controller = TabController(length: soal!.data!.length, vsync: this);

      isLoading = false;
      setState(() {});
    } else {
      print("Terjadi kesalahan saat pengambilan data Paket Latihan Soal List!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Latihan Soal',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Center(
                    child: TabBar(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      isScrollable: true,
                      indicatorColor: Colors.white,
                      controller: _controller,
                      tabs: List.generate(
                          soal!.data!.length,
                          (index) => Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff3A7FD5),
                                    ),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                        color: Color(0xff3A7FD5), fontSize: 12),
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: List.generate(
                        soal!.data!.length,
                        (index) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Soal no ${index + 1}",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xff979797),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: soal!.data![index]
                                                .questionTitleImg !=
                                            null
                                        ? Image.network(soal!
                                            .data![index].questionTitleImg!)
                                        : Text(
                                            soal!.data![index].questionTitle!,
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          builOptiondButton(
                                            index: int.parse(soal!
                                                .data![index].bankQuestionId!),
                                            option: "A",
                                            optionText:
                                                soal!.data![index].optionA,
                                            optionImg:
                                                soal!.data![index].optionAImg,
                                          ),
                                          builOptiondButton(
                                            index: int.parse(soal!
                                                .data![index].bankQuestionId!),
                                            option: "B",
                                            optionText:
                                                soal!.data![index].optionB,
                                            optionImg:
                                                soal!.data![index].optionBImg,
                                          ),
                                          builOptiondButton(
                                            index: int.parse(soal!
                                                .data![index].bankQuestionId!),
                                            option: "C",
                                            optionText:
                                                soal!.data![index].optionC,
                                            optionImg:
                                                soal!.data![index].optionCImg,
                                          ),
                                          builOptiondButton(
                                            index: int.parse(soal!
                                                .data![index].bankQuestionId!),
                                            option: "D",
                                            optionText:
                                                soal!.data![index].optionD,
                                            optionImg:
                                                soal!.data![index].optionDImg,
                                          ),
                                          builOptiondButton(
                                            index: int.parse(soal!
                                                .data![index].bankQuestionId!),
                                            option: "E",
                                            optionText:
                                                soal!.data![index].optionE,
                                            optionImg:
                                                soal!.data![index].optionEImg,
                                          ),
                                        ],
                                      )),
                                  buildButton(index, context)
                                ],
                              ),
                            )),
                  ),
                ),
              ],
            ),
    );
  }

  Align buildButton(int index, BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () async {
          if (soal!.data!.length - 1 == index) {
            String email = "alitopan@widyaedu.com";
            String exerciseId =
                Provider.of<StateProvider>(context, listen: false).exerciseId;
            List<String> idSoal = [];
            List<String> answer = [];

            for (var i = 0; i < soal!.data!.length; i++) {
              final element = soal!.data![i];
            }
            print(answerMap);
            for (var element in soal!.data!) {
              answerMap.addEntries([
                MapEntry(int.parse(element.bankQuestionId!),
                    answerMap[int.parse(element.bankQuestionId!)] ?? "X")
              ]);
            }
            print(answerMap);

            answerMap = Map.fromEntries(answerMap.entries.toList()
              ..sort((e1, e2) => e1.key.compareTo(e2.key)));
            print(answerMap);

            answerMap.forEach((key, value) {
              idSoal.add("$key");
              answer.add(value);
            });
            print(idSoal);
            print(answer);

            final payload = {
              "user_email": email,
              "exercise_id": exerciseId,
              "bank_question_id": idSoal,
              "student_answer": answer,
            };
            print(payload);

            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 5,
                            width: 90,
                            color: const Color(0xffC4C4C4),
                          ),
                          ClipRRect(
                            child: Image.asset("assets/images/img_success.png"),
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: "Kumpulkan latihan soal sekarang?",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: "\nBoleh langsung kumpulin dong",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff9C9C9C)))
                            ]),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.35,
                                        30),
                                    side: const BorderSide(
                                        color: Color(0xff3A7FD5)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    primary: Colors.white,
                                  ),
                                  child: Text("Nanti dulu",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff3A7FD5)))),
                              ElevatedButton(
                                  onPressed: () async {
                                    final result = await LatihanSoalApi()
                                        .postInputJawaban(payload);
                                    if (result != null) {
                                      final data =
                                          InputJawaban.fromJson(result);
                                      if (data.status == 1) {
                                        print(data);
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      fixedSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                          30),
                                      side: const BorderSide(
                                          color: Color(0xff3A7FD5)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      primary: const Color(0xff3A7FD5)),
                                  child: Text("Ya",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )))
                            ],
                          ),
                        ],
                      ));
                });
          } else {
            _controller!.animateTo(index + 1);
          }
        },
        child:
            Text(soal!.data!.length - 1 != index ? "Selanjutnya" : "Kumpulin"),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: const Color(0xff3A7FD5).withOpacity(0.7)),
      ),
    );
  }

  Map<int, String> answerMap = {};
  ElevatedButton builOptiondButton({
    required int? index,
    required String option,
    required String? optionText,
    required String? optionImg,
  }) {
    return ElevatedButton(
      onPressed: () {
        answerMap[index!] = option;
        setState(() {});
      },
      child: Align(
          alignment: Alignment.bottomLeft,
          child: optionImg != null
              ? Image.network(optionImg)
              : Text(
                  "$option. $optionText",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        primary: answerMap[index] == option
            ? const Color(0xff3A7FD5).withOpacity(0.7)
            : Colors.white,
      ),
    );
  }
}

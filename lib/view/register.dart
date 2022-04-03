// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuk isi data diri',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Clicked!")));
          },
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(21),
          children: [
            buildEmail(),
          ],
        ),
      ),
    );
  }

  Widget buildEmail() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Email"),
          TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "email@domain.com"),
          )
        ],
      );
}

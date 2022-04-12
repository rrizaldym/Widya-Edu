import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  int? _index;
  int get index => _index!;

  void getIndex(context) {
    _index = context;
    notifyListeners();
  }

  String? _email;
  String? _name;
  String? _gender;
  String? _class;
  String? _school;

  String? get email => _email;
  String? get name => _name;
  String? get gender => _gender;
  String? get kelas => _class;
  String? get school => _school;

  void getProfile(email, name, gender, kelas, school) {
    _email = email;
    _name = name;
    _gender = gender;
    _class = kelas;
    _school = school;
    notifyListeners();
  }
}

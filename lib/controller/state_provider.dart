import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  int? _courseId;
  int get courseId => _courseId!;

  void getCourseId(String context) {
    _courseId = int.parse(context);
    notifyListeners();
  }

  int? _courseContentId;
  int get courseContentId => _courseContentId!;

  void getCourseContentId(String context) {
    _courseContentId = int.parse(context);
    notifyListeners();
  }

  int? _subCourseContentId;
  int get subCourseContentId => _subCourseContentId!;

  void getSubCourseContentId(String context) {
    _subCourseContentId = int.parse(context);
    notifyListeners();
  }

  String? _courseName;
  String get courseName => _courseName!;

  void getCourseName(String context) {
    _courseName = context;
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

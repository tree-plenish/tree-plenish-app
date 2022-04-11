import 'package:flutter/material.dart';

class HostStateModel extends ChangeNotifier {
  int schoolid = 1001;
  String schoolname = '';

  String password = '102973';

  // example
  final List<String> list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'];

  HostStateModel.set(this.schoolid, this.schoolname);
  HostStateModel();

  void setSchoolId(int id) {
    schoolid = id;
  }

  void setSchoolName(String name) {
    schoolname = name;
  }

  void add(String item) {
    list.add(item);
    notifyListeners();
  }

  void removeAll() {
    list.clear();
    notifyListeners();
  }
}
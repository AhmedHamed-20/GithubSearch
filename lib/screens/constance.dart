import 'package:flutter/material.dart';

TextEditingController usernameController = TextEditingController();

int pag(int num) {
  double res = 1;
  res = num / 30;

  int finalres;
  finalres = res.ceil();
  return finalres;
}

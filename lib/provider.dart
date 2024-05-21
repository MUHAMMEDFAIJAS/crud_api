import 'dart:developer';

import 'package:crud_functions/model.dart';
import 'package:crud_functions/services.dart';
import 'package:flutter/material.dart';

class Serviceprovider extends ChangeNotifier {
  Apifunctions apifun = Apifunctions();

  Future<List<ApiModel>> fetchall() async {
    return await apifun.getall();
  }

  Future<void> addalldata(ApiModel model) async {
    await apifun.adddata(model);
    notifyListeners();
  }

  Future<void> updatealldata(ApiModel model) async {
    log('message');
    await apifun.updatedata(model);
    notifyListeners();
  }

  Future<void> deletaAlldata(String id) async {
    await apifun.deletedata(id);
    notifyListeners();
  }
}

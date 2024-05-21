import 'dart:developer';

import 'package:crud_functions/model.dart';
import 'package:dio/dio.dart';

class Apifunctions {
  Dio dio = Dio();

  Future<List<ApiModel>> getall() async {
    try {
      final reponse = await dio
          .get('https://contacts-management-server.onrender.com/api/contacts');

      if (reponse.statusCode == 200) {
        List<dynamic> jsndata = reponse.data;
        return jsndata.map((item) => ApiModel.fromJsom(item)).toList();
      } else {
        throw Exception('failed to fetch data');
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> adddata(ApiModel model) async {
    try {
      await dio.post(
          'https://contacts-management-server.onrender.com/api/contacts',
          data: model.toJson());
    } catch (e) {
      throw Exception('couldnt add');
    }
  }

  Future<void> updatedata(ApiModel model) async {
    try {
      log('fun');
      await dio.put(
          'https://contacts-management-server.onrender.com/api/contacts/${model.id}',
          data: model.toJson());
      log('com');
    } catch (e) {
      throw Exception('failed to fetch data');
    }
  }

  Future<void> deletedata(String id) async {
    try {
      await dio.delete(
          'https://contacts-management-server.onrender.com/api/contacts/$id');
    } catch (e) {
      throw Exception('failed to delete$e');
    }
  }
}

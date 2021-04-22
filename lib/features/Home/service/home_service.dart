import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/home_model.dart';

class HomeService {
  final Uri baseUrl;
  HomeService({required this.baseUrl});

  Future<List<HomeModel>> getHomeData() async {
    final response = await http.get(baseUrl);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body) as Map;
        final homeDataList = <HomeModel>[];

        jsonModel.forEach((key, value) {
          var model = HomeModel.fromJson(value);
          model.key = key;
          homeDataList.add(model);
        });
        return homeDataList;

      default:
        return Future.error(response.statusCode);
    }
  }
}

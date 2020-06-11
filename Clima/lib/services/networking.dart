import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  static NetworkService _instance;

  NetworkService._();
  static NetworkService getInstance() {
    if (_instance == null) {
      _instance = NetworkService._();
    }

    return _instance;
  }

  Future makeGetRequest({@required final String url}) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

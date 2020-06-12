import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  String _baseUrl =
      'https://apiv2.bitcoinaverage.com/indices/{symbol_set}/ticker';
  String _apiKey = 'ZWRhMDFhYzQzODUxNGRhOGEzMmQ4ODk0ZDlmYTg2YzA';

  Future<double> getBTCValue({String toCurrency = 'USD'}) async {
    print('Calling');
    http.Response response =
        await http.get('$_baseUrl/BTC$toCurrency', headers: {
      'x-ba-key': _apiKey,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode != 200) {
      Fluttertoast.showToast(
        msg: 'Something Went Wrong!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      return 0.0;
    }

    final json = jsonDecode(response.body);
    return json['last'];
  }
}

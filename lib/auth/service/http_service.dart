import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  String root = 'testlc.app365.vn';
  HttpService();
  Future<Map<String, dynamic>> getCountryCode(int numberOfItem) async {
    var url = Uri.http(root, '/api/ma-vung/dau-so',
        {'soDongDaHienThi': numberOfItem.toString()});
    print("${url}");
    var response = await http.get(url);

    var result = json.decode(response.body);
    return result;
  }
}

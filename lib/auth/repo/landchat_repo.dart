import 'package:app365/auth/model/country_code_model.dart';
import 'package:app365/auth/service/http_service.dart';

class LandChatRepo {
  final HttpService api;
  LandChatRepo({required this.api});

  Future<List<CountryCodeModel>> getCountryCode(int number) async {
    List<CountryCodeModel> _list = [];
    var listObject = await api.getCountryCode(number);
    print('Log: $listObject');

    return _list;
  }
}

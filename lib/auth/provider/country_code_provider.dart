import 'dart:convert';
import 'dart:developer';

import 'package:app365/auth/model/country_code_model.dart';
import 'package:app365/auth/provider/selected_country_provider.dart';
import 'package:app365/auth/service/http_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listCountry =
    StateNotifierProvider<CountryList, List<CountryCodeModel>>((ref) {
  return CountryList(ref: ref);
});
final loadMoreProvider = StateProvider((ref) => false);

class CountryList extends StateNotifier<List<CountryCodeModel>> {
  CountryList({List<CountryCodeModel>? countries, required this.ref})
      : super(countries ?? []) {
    _init();
  }
  final Ref ref;
  int number = 0;
  HttpService api = HttpService();
  void _init() async {
    var response = await api.getCountryCode(number);
    List<CountryCodeModel> list = [];
    for (var item in response['data']['maVungs'] as List) {
      CountryCodeModel model = CountryCodeModel.fromJson(item);
      list.add(model);
    }
    ref.read(seletedCountryProvider.notifier).changeCountry(list[0]);
    state = list;
  }

  void add() async {
    if (ref.read(loadMoreProvider) == true) {
      return;
    }
    ref.read(loadMoreProvider.notifier).state = true;
    number++;
    print('Page: $number');
    var response = await api.getCountryCode(number * 20);
    List<CountryCodeModel> list = [];
    for (var item in response['data']['maVungs'] as List) {
      CountryCodeModel model = CountryCodeModel.fromJson(item);
      list.add(model);
    }
    ref.read(loadMoreProvider.notifier).state = false;
    state = [...state, ...list];
  }

  void search(String name) {
    for (var element in state) {
      if (element.tenVung == name) {
        state = [element];
        continue;
      }
    }
    state = [];
  }
}

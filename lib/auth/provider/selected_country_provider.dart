import 'package:app365/auth/model/country_code_model.dart';
import 'package:app365/auth/provider/country_code_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final seletedCountryProvider =
    StateNotifierProvider<SelectedCountry, CountryCodeModel?>((ref) {
  return SelectedCountry(ref);
});

class SelectedCountry extends StateNotifier<CountryCodeModel?> {
  SelectedCountry(this.ref) : super(null);
  final Ref ref;

  void changeCountry(CountryCodeModel country) {
    state = country;
  }
}

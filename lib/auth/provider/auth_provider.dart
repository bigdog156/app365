import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkPhoneProvider = Provider<bool>((ref) {
  final phone = ref.watch(phoneString);
  print('Phone change: $phone');
  if (phone.length >= 9 && phone.length < 11) {
    return true;
  }
  return false;
});

final phoneString = StateProvider((ref) => '');

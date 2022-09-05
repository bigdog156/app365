import 'package:app365/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContinueButton extends ConsumerWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enableButton = ref.watch(checkPhoneProvider);
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
              enableButton ? Colors.blue : Colors.black12)),
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: 48,
        width: double.infinity,
        child: Text('Tiếp tục'),
      ),
    );
  }
}

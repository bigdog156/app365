import 'package:app365/auth/provider/country_code_provider.dart';
import 'package:app365/auth/widget/continue_button.dart';
import 'package:app365/auth/widget/input_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthCodeScreen extends ConsumerWidget {
  const AuthCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height <
                    MediaQuery.of(context).size.width
                ? MediaQuery.of(context).size.height * 1.5
                : MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: kToolbarHeight + 45, bottom: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FlutterLogo(size: 30),
                          Text(
                            'landchat',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Xin chào!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Vui lòng nhập số điện thoại của bạn để quản lí giao dịch bất động sản được hiểu quả hơn !',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const InputNumberWidget()
                  ],
                ),
                const ContinueButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

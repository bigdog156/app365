import 'package:app365/auth/model/country_code_model.dart';
import 'package:app365/auth/provider/selected_country_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryCodeItem extends ConsumerWidget {
  final CountryCodeModel item;
  final bool showDropDown;
  const CountryCodeItem(
      {super.key, required this.item, this.showDropDown = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(seletedCountryProvider.notifier).changeCountry(item);
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            item.icon,
            width: 20,
            height: 20,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.ma),
          ),
          if (showDropDown)
            const Icon(
              Icons.expand_more,
              color: Colors.grey,
            ),
          const Spacer(),
          Text(item.tenVung)
        ],
      ),
    );
  }
}

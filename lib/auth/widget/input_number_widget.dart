import 'package:app365/auth/provider/auth_provider.dart';
import 'package:app365/auth/provider/country_code_provider.dart';
import 'package:app365/auth/provider/selected_country_provider.dart';
import 'package:app365/auth/widget/country_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isBottomSheetProvider = StateProvider((ref) => false);
final isFull = StateProvider((ref) => false);

class InputNumberWidget extends ConsumerStatefulWidget {
  const InputNumberWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InputNumberWidgetState();
}

class _InputNumberWidgetState extends ConsumerState<InputNumberWidget> {
  final TextEditingController controller = TextEditingController();
  final DraggableScrollableController scrollController =
      DraggableScrollableController();
  ScrollController _controller = ScrollController();
  bool isShow = false;
  double hight = 0;
  bool full = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      print('Scroll: ${scrollController.size}');
      if (scrollController.size < 0.5 && isShow) {
        Navigator.of(context).pop();
        print("-----Off-----");
      }
      if (scrollController.size == 1) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height * 0.5;
    isShow = ref.watch(isBottomSheetProvider);
    full = ref.watch(isFull);
    ref.read(listCountry);
    //data
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (value) {
        ref.read(phoneString.state).state = value;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        prefixIcon: GestureDetector(
          onTap: () {
            print('Show many Item');
            ref.read(isBottomSheetProvider.state).state = true;
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                builder: (context) {
                  return DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    maxChildSize: 1,
                    controller: scrollController,
                    expand: true,
                    builder: ((context, scrollController) {
                      _controller = scrollController;
                      _controller.addListener(() {
                        print(
                            "Scroll new : ${_controller.position.maxScrollExtent}");
                        if (_controller.position.pixels ==
                            _controller.position.maxScrollExtent) {
                          ref.read(listCountry.notifier).add();
                        }
                      });
                      return Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          final repo = ref.watch(listCountry);
                          print('Len: ${repo.length}');
                          final loadMore = ref.watch(loadMoreProvider);
                          return Column(
                            children: [
                              Expanded(
                                child: Container(
                                  height: hight,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 40),
                                  color: Colors.white,
                                  child: ListView.separated(
                                    controller: _controller,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: repo.length,
                                    itemBuilder: ((context, index) =>
                                        CountryCodeItem(item: repo[index])),
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider();
                                    },
                                  ),
                                ),
                              ),
                              if (loadMore)
                                Container(
                                    color: Colors.white,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: CircularProgressIndicator.adaptive())
                              else
                                SizedBox(),
                            ],
                          );
                        },
                      );
                    }),
                  );
                }).then((value) {
              ref.read(isBottomSheetProvider.state).state = false;
            });
          },
          child: const LandIconPrefix(),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Số điện thoại'),
            Text('*', style: TextStyle(color: Colors.red))
          ],
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class LandIconPrefix extends ConsumerWidget {
  const LandIconPrefix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = ref.watch(seletedCountryProvider);
    return country != null
        ? Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    country.icon,
                    width: 30,
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(country.ma),
                  ),
                  Icon(Icons.arrow_drop_down),
                ]), // myIcon is a 48px-wide widget.
          )
        : const CircularProgressIndicator.adaptive();
  }
}

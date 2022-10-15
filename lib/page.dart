import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'data/model/item_model.dart';
import 'provider/provider.dart';

List<String> sliderList = [
  'https://mcpeaddons.com/wp-content/uploads/2022/08/dream-smp-skin-pack-4.jpg',
  'https://mcpeaddons.com/wp-content/uploads/2021/10/squid-game-skin-pack-15-skins-minecraft-pe-skin-packs.png',
  'https://mcpeaddons.com/wp-content/uploads/2022/06/top-10-skin-packs-for-minecraft-pe-players-1-696x392.png',
  'https://mcpeaddons.com/wp-content/uploads/2021/09/among-us-crewmates-skin-minecraft-5.jpg',
];

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemState = ref.watch(itemfiHistoryProvider);

    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: itemState.maybeWhen(
        orElse: () {},
        loaded: (itemModel) {
          return itemCategory(context, itemModel, ref);
        },
      ),
    );
  }

  itemCategory(BuildContext context, List<ItemModel>? items, WidgetRef ref) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: items!.length,
        itemBuilder: (BuildContext context, int index) {
          log('${items[index].thumbUrl}');
          return SizedBox(
            height: 120,
            width: double.infinity,
            child: InkWell(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.network(
                        items[index].thumbUrl!,
                        loadingBuilder: (context, url, _) =>
                            Image.asset('assets/placeholder_error.png', fit: BoxFit.fill),
                        errorBuilder: (context, url, error) =>
                            Image.asset('assets/placeholder_error.png', fit: BoxFit.fill),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //item name & author name
                            RichText(
                              text: TextSpan(
                                children: [
                                  textData(
                                    items[index].itemName!,
                                    "name",
                                    colorName: Colors.blueGrey,
                                  ),
                                  const TextSpan(
                                    text: ' by ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  textData(
                                    items[index].authorName!,
                                    "name",
                                    colorName: Colors.blueGrey,
                                  ),
                                ],
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),

                            //short description
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(top: 2),
                              child: RichText(
                                text: textData(items[index].shortDescription!, "desc"),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),

                            const Spacer(),

                            //
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(Icons.downloading_outlined),
                                Text(items[index].downloadCount.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  TextSpan textData(String data, String type, {Color? colorName}) {
    return TextSpan(
      text: data,
      style: TextStyle(
        fontSize: type == "name" ? 18 : 14,
        fontWeight: type == "name" ? FontWeight.bold : null,
        color: type == "name" ? colorName ?? Colors.grey : Colors.grey,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/generated/assets.dart';
import 'package:knowledge_queezy/src/config/theme.dart';

class AppEmptyWidget extends ConsumerWidget {
  const AppEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesEmptyBox,
            width: 96,
            height: 96,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Empty!",
            style: PrimaryFont.medium(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

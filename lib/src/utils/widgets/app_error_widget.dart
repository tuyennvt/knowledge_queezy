import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/generated/assets.dart';
import 'package:knowledge_queezy/src/config/theme.dart';

class AppErrorWidget extends ConsumerWidget {
  const AppErrorWidget({
    Key? key,
    this.error,
  }) : super(key: key);

  final String? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesError,
            width: 96,
            height: 96,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            error ?? "Something went wrong!",
            style: PrimaryFont.medium(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

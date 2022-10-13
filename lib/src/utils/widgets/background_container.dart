import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/generated/assets.dart';

class BackgroundContainer extends ConsumerWidget {
  const BackgroundContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesBg,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
